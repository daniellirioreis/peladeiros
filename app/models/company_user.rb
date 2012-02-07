# encoding: utf-8
class CompanyUser < ActiveRecord::Base
  set_table_name :companies_users  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :company, :class_name => "Company", :foreign_key => "company_id"
  has_many :accounts, :class_name => "Account", :foreign_key => "company_user_id" , :dependent => :delete_all
  validates_uniqueness_of :company_id, :scope => :user_id
  validates_presence_of :company_id
  validates_presence_of :user_id
  validates_presence_of :type_account
  validate :validate_calendar
  after_save :create_account

  scope :search, lambda { |name| where(:name.matches => "#{name}%") }
  scope :ordered, order(:name)

  protected 
  def validate_calendar
    if company.present?
      errors.add(:company, 'não possui calendário definido' ) unless company.calendar.present?
    end
  end
  
  def create_account
    if type_account == 1
        company.calendar.months.each do |month|
           account =  Account.new(:company_user_id => id, :month => month.first.to_i , :year => month.last.to_i, :price => company.price_for_month )
           account.save
        end
    end
  end
  
end
