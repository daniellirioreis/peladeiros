# encoding: utf-8
class Account < ActiveRecord::Base
  belongs_to :company_user, :class_name => "CompanyUser", :foreign_key => "company_user_id"
  scope :ordered, order("#{quoted_table_name}.name")
  validates_uniqueness_of :company_user_id, :scope => [:month, :year], :on => :create
  def to_s
    name
  end
  
  def month_string
    m = nil      
    if month == 1 
      m = "Janeiro"
    end
    
    if month == 2
       m = "Fevereiro"
    end

    if month == 3
      m = "Março"
    end

    if month == 4
       m = "Abril"
    end
   
    if month == 5
      m = "Maio"
    end

    if month == 6
      m = "Junho"
    end

    if month == 7
      m = "Julho"
    end
    
    if month == 8 
      m = "Agosto"
    end
    
    if month == 9
       m = "Setembro"
    end

    if month == 10
      m = "Outubro"
    end

    if month == 11
       m = "Novembro"
    end
   
    if month == 12
      m = "Dezembro"
    end    
      m
  end

end
