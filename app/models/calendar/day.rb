# encoding: utf-8
class Calendar::Day < ActiveRecord::Base
  belongs_to :calendar, :class_name => "Calendar", :foreign_key => "calendar_id"
  validates_uniqueness_of :date , :scope => [:calendar_id]
  has_many :games, :class_name => "Game", :foreign_key => "day_id"
  
  scope :ordered, order(:date)

  def to_s
    "#{date.day}/#{date.month}/#{date.year}" if date.present?
  end
  
  def weekday
    w = nil      
    if date.wday == 1 
      w = "Segunda"
    end
    
    if date.wday == 2
       w = "Terça"
    end

    if date.wday == 3
      w = "Quarta"
    end

    if date.wday == 4
       w = "Quinta"
    end
   
    if date.wday == 5
      w = "Sexta"
    end

    if date.wday == 6
      w = "Sábado"
    end

    if date.wday == 0
      w = "Domingo"
    end
      w
  end
  
end
