class Calendar::Day < ActiveRecord::Base
  belongs_to :calendar, :class_name => "Calendar", :foreign_key => "calendar_id"
  validates_uniqueness_of :date , :scope => [:calendar_id]
  
  
  scope :ordered, order(:date)

  def to_s
    "#{date.day}/#{date.month}/#{date.year}" if date.present?
  end
end
