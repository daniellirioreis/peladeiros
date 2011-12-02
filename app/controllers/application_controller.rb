class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :current_company
  
  
  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def current_company
    current_user.company_default
  end
end
