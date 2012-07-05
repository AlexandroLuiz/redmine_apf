class ConfigurationApfForTransactionTypesController < ApplicationController
  unloadable
   menu_item :APF
  before_filter :current_project
  before_filter :authorize, :only => [:index]


  def index
     @configuration_apf_for_EE = ConfigurationApfForTransactionType.find_all_by_type_of_functionality_id(3)
     @configuration_apf_for_SE = ConfigurationApfForTransactionType.find_all_by_type_of_functionality_id(4)
     @configuration_apf_for_CE = ConfigurationApfForTransactionType.find_all_by_type_of_functionality_id(5)
  end


 private
  def current_project
      @project = Project.find(params[:project_id])
   end

end

