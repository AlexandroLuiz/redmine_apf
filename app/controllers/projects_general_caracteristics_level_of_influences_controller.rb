class ProjectsGeneralCaracteristicsLevelOfInfluencesController < ApplicationController

  unloadable

   menu_item :APF
  before_filter :current_project
  before_filter :authorize, :only => [:index, :new, :edit]
  include ProjectsGeneralCaracteristicsLevelOfInfluencesHelper


  def index
      @general_caracteristics = GeneralCaracteristic.find(:all)
  end



  def new
    @general_caracteristic = GeneralCaracteristic.find(params[:id])
    @level_of_influences = LevelOfInfluence.find(:all).collect{ |l| [l.name, l.id]}
    @projects_general_caracteristics_level_of_influence = ProjectsGeneralCaracteristicsLevelOfInfluence.new
  end

  def edit
        @projects_general_caracteristics_level_of_influence = ProjectsGeneralCaracteristicsLevelOfInfluence.find(params[:id])
  end

  def create
     @projects_general_caracteristics_level_of_influence = ProjectsGeneralCaracteristicsLevelOfInfluence.new(params[:projects_general_caracteristics_level_of_influence])

      respond_to do |format|
      if @projects_general_caracteristics_level_of_influence.save
        format.html { redirect_to(project_projects_general_caracteristics_level_of_influences_url, :notice => l('notice_successful_create')) }
        format.xml  { render :xml => @projects_general_caracteristics_level_of_influence, :status => :created, :location => @functional_requirement}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @projects_general_caracteristics_level_of_influence.errors, :status => :unprocessable_entity }
      end
    end

  end

  def update
    @projects_general_caracteristics_level_of_influence = ProjectsGeneralCaracteristicsLevelOfInfluence.find(params[:id])

      respond_to do |format|
      if @projects_general_caracteristics_level_of_influence.update_attributes(params[:projects_general_caracteristics_level_of_influence])
        format.html { redirect_to(project_projects_general_caracteristics_level_of_influences_url, :notice => l('notice_successful_updated')) }
        format.xml  { render :xml => @projects_general_caracteristics_level_of_influence, :status => :created, :location => @functional_requirement}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @projects_general_caracteristics_level_of_influence.errors, :status => :unprocessable_entity }
      end
    end
  end


  private
   def current_project
      @project = Project.find(params[:project_id])
   end
end

