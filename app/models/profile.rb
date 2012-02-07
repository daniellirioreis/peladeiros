class Profile < ActiveRecord::Base
  has_and_belongs_to_many :roles

  scope :search, lambda { |name| where(:name.matches => "#{name}%") }
  scope :ordered, order(:name)

  validates :name, :presence => true, :uniqueness => { :allow_blank => true }

  attr_accessible :name, :role_ids

  def to_s
    name.to_s
  end

end
