class Company < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  has_one :calendar, :class_name => "Calendar", :foreign_key => "company_id"
  has_many :games, :class_name => "Game", :foreign_key => "company_id"
  has_and_belongs_to_many :users, :join_table => "companies_users", :foreign_key => 'company_id'

  def to_s
    name
  end
  
  def members
    members_of_company = []
    User.all.each do |u|
      members_of_company << u if u.company_ids.include?(id) || u.company_default_id == id 
    end
    members_of_company     
  end
  
end
