# encoding: utf-8
class EscalationsController < ApplicationController
  before_filter :authenticate_user!  
  before_filter :authorize_controller!    
  before_filter :company_have_games
  
  def index
    
    unless current_company == nil
      @games = Game.for_status(0).for_company_id(current_company.id).paginate(:per_page => 2, :page => params[:page])
    else
      flash[:alert] = "Acesse 'Meu perfil' e defina um clube padrão para fazer pesquisar de jogos."
      
      redirect_to dashboard_path
    end
      
  end
  
  def new
    @escalation = Escalation.new
    @escalation.game = Game.find(params[:game_id])
    @escalation.user = current_user

    respond_to do |format|
      format.html # new.html.erb
    end
  
  end
  
  def create
    @escalation = Escalation.new(params[:escalation])

    respond_to do |format|
      if @escalation.save
        format.html { redirect_to(current_company.calendar, :notice => 'Presença confirmada com sucesso.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @escalation.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  protected
  
  def company_have_games
    unless current_company.nil? 
      unless current_company.games.present?
        flash[:alert] = 'Não existem jogos cadastrados'
        redirect_to dashboard_path
      end          
    else
      flash[:alert] = ' É necessário definir um clube para consulta.'
      redirect_to dashboard_path      
    end
  end
  
  def authorize_controller!
    authorize! action_name.to_sym, full_controller_name
  end
  
  
end