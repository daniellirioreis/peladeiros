# encoding: utf-8
class Company < ActiveRecord::Base
  has_one :calendar, :class_name => "Calendar", :foreign_key => "company_id"
  has_many :games, :class_name => "Game", :foreign_key => "company_id"
  has_many :companies_users, :class_name => "CompanyUser", :foreign_key => "company_id"
  validates_presence_of :name
  validates_presence_of :number_members
  validates_presence_of :price_for_month
  validates_numericality_of :number_members
  validate :number_members_cannot_less_two
  
  scope :ordered, order("#{quoted_table_name}.name")
  
  def to_s
    name
  end
  
  def self.on_line
    companies = []
    Company.all.each do |company|
      unless company.users.count >= company.number_members.to_i
        
        companies << company
      end
    end
    companies
  end
  
  def members
    members_of_company = []
    User.all.each do |u|
      members_of_company << u if u.company_ids.include?(id) || u.company_default_id == id 
    end
    members_of_company     
  end

  protected  
  def number_members_cannot_less_two
    unless number_members.blank?
        errors.add(:number_members, 'não pode ser menor ou igual que 1' ) if number_members.to_i <= 1
    end
  end
end
