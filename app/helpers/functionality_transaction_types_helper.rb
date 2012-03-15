module FunctionalityTransactionTypesHelper
  include GlobalHelper

  def functionalities_types_for_select
    TypeOfFunctionality.find_all_by_id([3,4,5]).collect{|t| [t.name, t.id]}
  end
end

