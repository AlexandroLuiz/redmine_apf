class ConfigurationApfForTransactionTypesController < ApplicationController
  unloadable
   menu_item :apf
  before_filter :current_project
  before_filter :authorize, :only => [:index, :edit]


  def index
     @configuration_apf_for_transaction_types = ConfigurationApfForTransactionType.find_all_by_type_of_functionality_id(3)
     @configuration_apf_for_transaction_types += ConfigurationApfForTransactionType.find_all_by_type_of_functionality_id(4)
     @configuration_apf_for_transaction_types += ConfigurationApfForTransactionType.find_all_by_type_of_functionality_id(5)
  end


  def edit
    @configuration_apf_for_transaction_type = ConfigurationApfForTransactionType.find(params[:id])
  end



  def update
  end

 private
  def current_project
      @project = Project.find(params[:project_id])
   end

end

