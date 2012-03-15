class ConfigurationApfForDataTypesController < ApplicationController
  unloadable

  menu_item :apf
  before_filter :current_project
  before_filter :authorize, :only => [:index, :edit]

  def index
    @configuration_apf_for_ALI = ConfigurationApfForDataType.find_all_by_type_of_functionality_id(1)
    @configuration_apf_for_AIE = ConfigurationApfForDataType.find_all_by_type_of_functionality_id(2)
  end


  def edit
    @configuration_apf_for_data_type = ConfigurationApfForDataType.find(params[:id])
  end


  def update

  end



  private
  def current_project
      @project = Project.find(params[:project_id])
   end

end

