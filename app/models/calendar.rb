# encoding: utf-8
class Calendar < ActiveRecord::Base
  belongs_to :company, :class_name => "Company", :foreign_key => "company_id"
  has_many :days, :class_name => "Calendar::Day", :foreign_key => "calendar_id"
  validates_presence_of :date_end
  validates_presence_of :date_start
  validate :a
  validate :b
  validate :c
  after_save :create_days
  
  scope :for_company_id , lambda {|id| where(:company_id => id)}
  
  def date_end_previews
    "#{date_end_was.day}/#{date_end_was.month}/#{date_end_was.year}"
  end
  
  
  def months
    (date_start..date_end).map do |data|
      [data.month, data.year]
    end.uniq
  end
  
  
  protected 
  
  def a
    errors.add(:date_end, 'não pode ser menor que data inicial' ) if date_end < date_start    
  end

  def b
    errors.add(:date_end, 'não pode ser igual que data inicial' ) if date_end  ==  date_start    
  end

  def c
    unless self.new_record?
      errors.add(:date_end, "não pode ser menor que #{date_end_previews}" ) if date_end  < date_end_was    
    end
  end
  
  def create_days
    (date_start..date_end).each do |d|
      day = Calendar::Day.new(:calendar_id => id , :date => d)
      day.save
    end    
  end
  
end
