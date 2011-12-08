# encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate_user!  

  def linking_company
    unless current_company == nil    
      @companies = current_user.companies.paginate(:per_page => 1, :page => params[:page])
    else
      flash[:alert] = "Acesse 'Meu perfil' e defina um clube padrão para fazer pesquisar de jogos."      
      redirect_to dashboard_path      
    end
  end
  
  def switch_to_company
    current_user.update_attribute(:company_default_id, params[:id])
    redirect_to dashboard_path
    flash[:notice] = "Você escolheu #{current_user.company_default} como seu clube de consulta."
  end
  
end