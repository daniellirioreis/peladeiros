# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :current_company
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to dashboard_path, :alert => default_message = "Você não tem autorização para acessar, favor entrar em contato com o administrador do sistema."
  end
  
  protected
  
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def current_company
    current_user.company_default unless current_user.company_default == nil
  end
  
  
  def self.full_controller_name
    @full_controller_name ||= self.name.sub(/Controller$/, '').underscore
  end

  def full_controller_name
    self.class.full_controller_name
  end
  
end
