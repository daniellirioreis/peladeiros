class Role < ActiveRecord::Base
  has_and_belongs_to_many :profiles

  scope :ordered, order(:controller, :action)

  validates :controller, :action, :presence => true
  validates :action, :uniqueness => { :scope => :controller }, :allow_blank => true, :if => :controller?

  attr_accessible :controller, :action

  def to_s
   I18n.t("roles.#{controller}") if controller?
  end

  def action_to_s
     string = ""
    if action == "create"
      string = "Salvar"
    end
    
    if action == "update"
      string = "Editar"
    end
    
    if action == "destroy"
      string = "Apagar"
    end
    
    if action == "read"
      string = "Consultar"
    end
    
    if action == "closed"
      string = "Fechar"
    end
    
    if action == "paid"
      string = "Pagar"
    end
    
    if action == "switch_to_company"
      string = "Trocar de clube"
    end
    string
  end
  
end
