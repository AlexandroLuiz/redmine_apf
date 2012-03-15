class FunctionalitiesController < ApplicationController
  unloadable

  menu_item :apf
  before_filter :current_project
  before_filter :authorize, :only => [:index, :show, :new, :edit, :destroy]

  def index
    @functionalities = Functionality.find(:all)

  end

  def new
    @functionality = Functionality.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @functionality }
    end
  end

  def edit

  end

  def show

  end

  def create
      @functionality = Functionality.new(params[:functionality])

      respond_to do |format|
      if @functionality.save
        format.html { redirect_to(project_functionalities_url, :notice => 'Functionality was successfully created.') }
        format.xml  { render :xml => @functionality, :status => :created, :location => @functional_requirement}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @functionality.errors, :status => :unprocessable_entity }
      end
    end
  end

  def updated

  end

  def destroy

  end

  private
  def current_project
      @project = Project.find(params[:project_id])
   end


end

