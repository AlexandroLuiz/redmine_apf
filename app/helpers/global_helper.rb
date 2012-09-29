module GlobalHelper

    def link_to_edit(url = {},authorized_options = {}, html_options = {})
      link_to_if_authorized(l(:button_update), url, authorized_options, html_options)
  end

  def link_to_destroy(url = {}, authorized_options = {}, html_options = {})
     link_to_if_authorized(l(:button_delete), url, authorized_options, html_options)
  end

  def link_to_new(model, url = {}, authorized_options = {}, html_options = {})
    link_to_if_authorized(t("new", :model => t(model.name)), url, authorized_options, html_options)
  end

  def total_pf
    acum = 0
     functionality_data_types = FunctionalityDataType.find_all_by_project_id(@project.id)
     functionality_data_types.each do |functionality_data_type|
     acum += qnt_pf_by_functionality(functionality_data_type.type_of_functionality.name, functionality_data_type.qnt_type_register, functionality_data_type.qnt_type_data)
     end

     functionality_transaction_types = FunctionalityTransactionType.find_all_by_project_id(@project.id)
     functionality_transaction_types.each do |functionality_transaction_type|
      acum += qnt_pf_by_functionality(functionality_transaction_type.type_of_functionality.name, functionality_transaction_type.qnt_reference_file, functionality_transaction_type.qnt_type_data)
    end
     acum
  end

  def qnt_pf_by_functionality(type_of_functionality, qnt_type_register_or_file_references, qnt_type_data)
    retorno = 0
    case type_of_functionality
     when "ALI"
       configuration_apf_for_data_types = ConfigurationApfForDataType.find_all_by_type_of_functionality_id(1)
       configuration_apf_for_data_types.each do |conf|
        if(((qnt_type_register_or_file_references >= conf.type_of_register_min) && (qnt_type_register_or_file_references <= conf.type_of_register_max)) && ((qnt_type_data >= conf.type_of_data_min) && (qnt_type_data <=conf.type_of_data_max)))
           retorno = conf.pf
        end
       end
     when "AIE"
        configuration_apf_for_data_types = ConfigurationApfForDataType.find_all_by_type_of_functionality_id(2)
       configuration_apf_for_data_types.each do |conf|
        if(((qnt_type_register_or_file_references >= conf.type_of_register_min) && (qnt_type_register_or_file_references <= conf.type_of_register_max)) && ((qnt_type_data >= conf.type_of_data_min) && (qnt_type_data <=conf.type_of_data_max)))
           retorno = conf.pf
        end
       end
     when "EE"
       configuration_apf_for_data_types = ConfigurationApfForDataType.find_all_by_type_of_functionality_id(3)
       configuration_apf_for_data_types.each do |conf|
        if(((qnt_type_register_or_file_references >= conf.type_of_reference_file_min) && (qnt_type_register_or_file_references <= conf.type_of_reference_file_max)) && ((qnt_type_data >= conf.type_of_data_min) && (qnt_type_data <=conf.type_of_data_max)))
           retorno = conf.pf
        end
       end
     when "SE"
        configuration_apf_for_data_types = ConfigurationApfForDataType.find_all_by_type_of_functionality_id(4)
       configuration_apf_for_data_types.each do |conf|
        if(((qnt_type_register_or_file_references >= conf.type_of_reference_file_min) && (qnt_type_register_or_file_references <= conf.type_of_reference_file_max)) && ((qnt_type_data >= conf.type_of_data_min) && (qnt_type_data <=conf.type_of_data_max)))
           retorno = conf.pf
        end
       end
     when "CE"
        configuration_apf_for_data_types = ConfigurationApfForDataType.find_all_by_type_of_functionality_id(5)
       configuration_apf_for_data_types.each do |conf|
        if(((qnt_type_register_or_file_references >= conf.type_of_reference_file_min) && (qnt_type_register_or_file_references <= conf.type_of_reference_file_max)) && ((qnt_type_data >= conf.type_of_data_min) && (qnt_type_data <=conf.type_of_data_max)))
           retorno = conf.pf
        end
       end
    end
    retorno
  end

  def calc_ajustment_factor
     @projects_general_caracteristics_level_of_influences = ProjectsGeneralCaracteristicsLevelOfInfluence.find_all_by_project_id(@project.id)
     acum = 0
     @projects_general_caracteristics_level_of_influences.each do |p|
     acum += p.level_of_influence.level
     end
     vaf = (acum * 0.01) + 0.65
     dfp = total_pf * vaf
     dfp
  end
end

