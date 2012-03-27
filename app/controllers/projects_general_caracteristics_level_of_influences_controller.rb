class ProjectsGeneralCaracteristicsLevelOfInfluencesController < ApplicationController

  unloadable

   menu_item :apf
  before_filter :current_project
  before_filter :authorize, :only => [:index, :new, :edit]


  def index
      @general_caracteristics = GeneralCaracteristic.find(:all)

  end

  def show
  end

  def new
    @general_caracteristic = GeneralCaracteristic.find(params[:id])
    @level_of_influences = LevelOfInfluence.find(:all).collect{ |l| [l.name, l.id]}
    @projects_general_caracteristics_level_of_influence = ProjectsGeneralCaracteristicsLevelOfInfluence.new
  end

  def edit
  end

  def create
     @projects_general_caracteristics_level_of_influence = ProjectsGeneralCaracteristicsLevelOfInfluence.new(params[:projects_general_caracteristics_level_of_influence])

      respond_to do |format|
      if @projects_general_caracteristics_level_of_influence.save
        format.html { redirect_to(project_projects_general_caracteristics_level_of_influences_url, :notice => 'Level of influence was successfully created.') }
        format.xml  { render :xml => @projects_general_caracteristics_level_of_influence, :status => :created, :location => @functional_requirement}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @projects_general_caracteristics_level_of_influence.errors, :status => :unprocessable_entity }
      end
    end

  end

  def update
  end

  def destroy
  end

  private
   def current_project
      @project = Project.find(params[:project_id])
   end
end

