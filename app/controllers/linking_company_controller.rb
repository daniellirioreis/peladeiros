# encoding: utf-8
class LinkingCompanyController < ApplicationController
  before_filter :authenticate_user!    
#  before_filter :authorize_controller!    

  def show
    
  end

  def index
    unless current_user.companies.empty?
      @companies = current_user.companies.paginate(:per_page => 1, :page => params[:page])
    else
      flash[:alert] = ' É necessário definir uma conta em um clube.'
      redirect_to dashboard_path      
    end
  end
  
  def switch_to_company
    current_user.update_attribute(:company_default_id, params[:id])
    redirect_to dashboard_path
    flash[:notice] = "Você escolheu #{current_user.company_default} como seu clube de consulta."
  end
  protected
  def authorize_controller!
    authorize! action_name.to_sym, full_controller_name
  end
  
  
end