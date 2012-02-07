# encoding: utf-8
class CalendarsController < ApplicationController
  before_filter :authenticate_user!    
  before_filter :authorize_controller!  
  
  # GET /calendars
  # GET /calendars.xml
  def index
    @calendars = Calendar.for_company_id(params[:company_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calendars }
    end
  end

  # GET /calendars/1
  # GET /calendars/1.xml
  def show
    @calendar = Calendar.find(params[:id])
    if params[:search].blank?
      @days = @calendar.days.search(Date.today).ordered.paginate(:per_page => 1, :page => params[:page])
    else
      data = params[:search] 
      data = Date.parse(data[6,4]+'-'+data[3,2]+'-'+data[0,2])      
      @days = @calendar.days.search(data).ordered.paginate(:per_page => 1, :page => params[:page])
      if @days.empty?
        @days = @calendar.days.ordered.paginate(:per_page => 1, :page => params[:page])        
        flash[:notice] = "Não existem no calendário a data informada"
      else
        flash[:notice] = "Dia encontrado com sucesso"
      end
    end

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /calendars/new
  # GET /calendars/new.xml
  def new
    @calendar = Calendar.new
    @calendar.company = Company.find(params[:company_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calendar }
    end
  end

  # GET /calendars/1/edit
  def edit
    @calendar = Calendar.find(params[:id])
  end

  # POST /calendars
  # POST /calendars.xml
  def create
    @calendar = Calendar.new(params[:calendar])

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to(calendars_path(:company_id => @calendar.company_id), :notice => 'Calendário criado com sucesso.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calendar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calendars/1
  # PUT /calendars/1.xml
  def update
    @calendar = Calendar.find(params[:id])

    respond_to do |format|
      if @calendar.update_attributes(params[:calendar])
        format.html { redirect_to(calendars_path(:company_id => @calendar.company_id), :notice => 'Calendário atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calendar.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.xml
  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy

    respond_to do |format|
      format.html { redirect_to(calendars_url) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def authorize_controller!
    authorize! action_name.to_sym, full_controller_name
  end
  
end
