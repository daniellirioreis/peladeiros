# encoding: utf-8
class GamesController < ApplicationController
  before_filter :authenticate_user!  
  before_filter :authorize_controller!
  before_filter :company_have_calendar
  
  # GET /games
  # GET /games.xml
  def index
    unless current_company == nil
      @games = Game.for_company_id(current_company.id).paginate(:per_page => 5, :page => params[:page])
    else
      flash[:alert] = "Acesse 'Minha Conta' e defina um clube padrão para fazer pesquisar de jogos."      
      redirect_to dashboard_path
    end
  end
  
  def closed
    @game = Game.find(params[:id])
    respond_to do |format|
      if @game.closed
        format.html { redirect_to(current_company.calendar, :notice => 'Jogo fechado com sucesso.') }
      else
        format.html { redirect_to(current_company.calendar, :alert => @game.errors.full_messages) }
      end
    end
    
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new
    day = Calendar::Day.find(params[:day_id])
    @game.company = current_company
    @game.day = day
    @game.user = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])
    @game.status = 0
    respond_to do |format|
      if @game.save
#        @game.send_email    
        format.html { redirect_to(current_company.calendar, :notice => 'Jogo criado com sucesso.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    @game = Game.find(params[:id])
    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to(current_company.calendar, :notice => 'Jogo atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def company_have_calendar
    unless current_company.nil?
      if current_company.calendar.nil?
        flash[:alert] = 'Jogos não pode ser criado. É necessário definir um calendário'
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
