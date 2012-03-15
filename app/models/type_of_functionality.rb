class TypeOfFunctionality < ActiveRecord::Base
  unloadable

  has_many :functionalities
  has_many :configuration_apf_for_functionalities
end

