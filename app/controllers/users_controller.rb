# encoding: utf-8
class UsersController < ApplicationController

  def linking_company
    
    @companies = current_user.companies.paginate(:per_page => 1, :page => params[:page])
  
  end
  
  def switch_to_company
    current_user.update_attribute(:company_default_id, params[:id])
    redirect_to dashboard_path
    flash[:notice] = "Você escolheu #{current_user.company_default} como seu clube de consulta."
  end
  
end