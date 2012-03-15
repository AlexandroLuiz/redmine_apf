ActionController::Routing::Routes.draw do |map_apf|

  map_apf.resources :projects do |r|
    r.resources :functionality_data_types
    r.resources :functionality_transactions_types
  end



  map_apf.resources :projects do |p|
    p.resources :functionality_transaction_types
    p.resources :functionality_data_types
    p.resources :configuration_apf_for_data_types
    p.resources :configuration_apf_for_transaction_types
    p.resources :projects_general_caracteristics_level_of_influences
  end

end

