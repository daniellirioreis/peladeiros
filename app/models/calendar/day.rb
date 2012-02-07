# encoding: utf-8
class Calendar::Day < ActiveRecord::Base
  belongs_to :calendar, :class_name => "Calendar", :foreign_key => "calendar_id"
  validates_uniqueness_of :date , :scope => [:calendar_id]
  has_many :games, :class_name => "Game", :foreign_key => "day_id"
  
  scope :ordered, order(:date)

  scope :search, lambda { |search| where(:date => "#{search}%") }

  def to_s
    date.day.to_s + '/' + date.month.to_s + '/' + date.year.to_s
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

  def month_string
    m = nil      
    if date.month == 1 
      m = "Janeiro"
    end
    
    if date.month == 2
       m = "Fevereiro"
    end

    if date.month == 3
      m = "Março"
    end

    if date.month == 4
       m = "Abril"
    end
   
    if date.month == 5
      m = "Maio"
    end

    if date.month == 6
      m = "Junho"
    end

    if date.month == 7
      m = "Julho"
    end
    
    if date.month == 8 
      m = "Agosto"
    end
    
    if date.month == 9
       m = "Setembro"
    end

    if date.month == 10
      m = "Outubro"
    end

    if date.month == 11
       m = "Novembro"
    end
   
    if date.month == 12
      m = "Dezembro"
    end    
      m
  end
  
end
