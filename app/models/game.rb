# encoding: utf-8
class Game < ActiveRecord::Base
  belongs_to :company, :class_name => "Company", :foreign_key => "company_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :place_now, :class_name => "Place", :foreign_key => "place"
  
  validates_presence_of :company_id
  validates_presence_of :user
  validates_presence_of :place
  validates_presence_of :name
  validates_presence_of :number_team
  validates_presence_of :number_of_players_in_team
  validates_numericality_of :number_team
  validates_numericality_of :number_of_players_in_team
  validate :number_team_cannot_less_two
  has_many :escalations, :class_name => "Escalation", :foreign_key => "game_id" , :dependent => :delete_all
  
  scope :for_company_id , lambda {|id| where(:company_id => id)}

  scope :for_status , lambda {|status| where(:status => status)}

  scope :ordered, order("#{quoted_table_name}.date DESC")
  

  def to_s
    name.to_s if name
    
  end
  
  def closed
    if escalations.any?
      self.update_attribute(:status, 2)
      self.send_email        
      
      true
    else
      errors.add(:id, 'não pode ser fechado sem convocações' )
      false
    end
    
  end


  def send_email    
    GameMailer.mensagem_boas_vindas(User.first, self).deliver
  end
  

  protected 


    
    def number_team_cannot_less_two
      
      errors.add(:number_team, 'não pode ser menor que 2' ) if number_team.to_i < 2
      
    end
    
end
