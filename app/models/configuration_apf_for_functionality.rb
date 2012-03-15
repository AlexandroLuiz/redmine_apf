class ConfigurationApfForFunctionality < ActiveRecord::Base
  unloadable
  belongs_to :type_of_functionality
end

