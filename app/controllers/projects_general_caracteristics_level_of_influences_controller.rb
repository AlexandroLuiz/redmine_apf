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

