module FunctionalityDataTypesHelper
  include GlobalHelper

  def functionalities_types_for_select
    TypeOfFunctionality.find_all_by_id([1,2]).collect{|t| [t.name, t.id]}
  end
end

