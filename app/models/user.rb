# encoding: utf-8
class User < ActiveRecord::Base
  belongs_to :company_default, :class_name => 'Company', :foreign_key => 'company_default_id'
  belongs_to :profile, :class_name => "Profile", :foreign_key => "profile_id"
  has_many :companies, :class_name => "CompanyUser", :foreign_key => "user_id"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :registerable#,
         #:recoverable#, 
         #:rememberable#, 
         #:trackable#, 
         #:validatable

  delegate :roles, :to => :profile, :allow_nil => true
  
#  validate :have_only_company

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :company_ids, :company_default_id
  validates_presence_of :profile_id, :on => :update
  
  def to_s
    email    
  end
end

  
