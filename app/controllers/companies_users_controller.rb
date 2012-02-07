# encoding: utf-8
class CompaniesUsersController < ApplicationController
  def index
    if current_user.profile_id == 1
      if current_company.present?
        @companies_users = current_company.companies_users                
      else
        @companies_users = current_user.companies
      end  
    else
      @companies_users = current_user.companies
    end
  end
  
  def new
    @company_user = CompanyUser.new
    @company_user.user = current_user
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def edit
    @company_user = CompanyUser.find(params[:id])    
  end

  def create
    @company_user = CompanyUser.new(params[:company_user])
    respond_to do |format|
      if @company_user.save
        format.html { redirect_to(companies_users_path, :notice => 'Conta criada com sucesso.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company_user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @company_user = CompanyUser.find(params[:id])
    respond_to do |format|
      if @company_user.update_attributes(params[:company_user])
        format.html { redirect_to(companies_users_path, :notice => 'Conta atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company_user.errors, :status => :unprocessable_entity }
      end
    end
  end  
end