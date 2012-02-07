class DayGamesController < ApplicationController
  before_filter :authenticate_user!  
  before_filter :authorize_controller!  

  def index
    day = Calendar::Day.find(params[:day_id])
    @games = day.games.paginate(:per_page => 5, :page => params[:page])    
    @calendar = day.calendar    
  end
  
  protected
  def authorize_controller!
    authorize! action_name.to_sym, full_controller_name
  end
  
end