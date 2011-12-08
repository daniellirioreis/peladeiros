# encoding: utf-8
class User < ActiveRecord::Base
  belongs_to :company_default, :class_name => 'Company', :foreign_key => 'company_default_id'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :companies, :join_table => "companies_users", :foreign_key => 'user_id'
  
#  validate :have_only_company

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_ids, :company_default_id
  validates_presence_of :company_default_id, :on => :update
  
  def to_s
    email    
  end
  
  protected
    def have_only_company
      errors.add(:companies, "não foi informada") unless company_ids.any?             
    end    
end

  
