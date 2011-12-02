class Game < ActiveRecord::Base

  belongs_to :company, :class_name => "Company", :foreign_key => "company_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :place_now, :class_name => "Place", :foreign_key => "place"
  after_save :send_email
  
  validates_presence_of :company_id
  validates_presence_of :user
  validates_presence_of :place
  validates_presence_of :name
  validates_presence_of :number_team
  validates_presence_of :number_of_players_in_team

  
#  scope :for_status , lambda {|status| where(:status => status)}
  scope :for_company_id , lambda {|id| where(:company_id => id)}

  scope :ordered, order("#{quoted_table_name}.date DESC")
  
  
  protected 

    def send_email      
      GameMailer.mensagem_boas_vindas(User.first).deliver
    end

end
