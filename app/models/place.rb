class Place < ActiveRecord::Base
  validates_presence_of :name, :on => :create, :message => "can't be blank"

  def to_s
    name    
  end
end
