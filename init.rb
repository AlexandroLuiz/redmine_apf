require 'redmine'

Redmine::Plugin.register :redmine_apf do
  name 'Apf plugin'
  author 'Alexandro Luiz Hilleshein'
  description 'This is a plugin for Redmine for aplication of APF on software projects'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  project_module :apf do
   permission :view_configuration_apf_for_data_type, :configuration_apf_for_data_types => [:index]
   permission :edit_configuration_apf_for_data_type, :configuration_apf_for_data_types => [:edit]
   permission :view_configuration_apf_for_transaction_type, :configuration_apf_for_transaction_types => [:index]
   permission :edit_configuration_apf_for_transaction_type, :configuration_apf_for_transaction_types => [:edit]
   permission :create_and_update_functionality_data_type, :functionality_data_types => [:new, :edit]
   permission :view_functionalities_data_type, :functionality_data_types => [:index, :show]
   permission :create_and_update_functionality_transaction_type, :functionality_transaction_types => [:new, :edit]
   permission :view_functionalities_transaction_type, :functionality_transaction_types => [:index, :show]
   permission :destroy_functionalities_data_type, :functionality_data_types => :destroy
   permission :destroy_functionalities_transaction_type, :functionality_transaction_types => :destroy
   permission :view_configuration_adjustment_factor, :projects_general_caracteristics_level_of_influences => [:index]
   permission :configure_adjustment_factor, :projects_general_caracteristics_level_of_influences => [:new, :edit]
   menu :project_menu, :apf, { :controller => 'functionality_data_types', :action => 'index' }, :caption => 'APF', :after => :activity, :param => :project_id
   end
end

