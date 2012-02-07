class DashboardController < ApplicationController
  before_filter :authenticate_user!  

  def index
    if current_user.profile.nil?
      flash[:alert] = "Acesso o menu meus dados e defina seu perfil"
    end      
  end
end