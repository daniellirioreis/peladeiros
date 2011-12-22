class Place < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :city
  validates_presence_of :responsable

  def to_s
    name.to_s    
  end
end
