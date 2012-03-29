module ProjectsGeneralCaracteristicsLevelOfInfluencesHelper
  include GlobalHelper


  #Recebe como parametro o id de uma cararacterística geral do sistema
  #retorna em string, o nível de influência da cararacterística geral recebida por parâmetro para o projeto atual

  def filter_projects_general_caracteristics_level_of_influences(general_caracteristic_id)
     @projects_general_caracteristics_level_of_influence = filter_level_of_influence(general_caracteristic_id)
    if(@projects_general_caracteristics_level_of_influence == nil)
     "Ainda não ajustado"
   else
     "#{@projects_general_caracteristics_level_of_influence.level_of_influence.level} #{@projects_general_caracteristics_level_of_influence.level_of_influence.name}"
   end
  end

  #Recebe como parametro o id de uma cararacterística geral do sistema
  #retorna um objeto nível de influência da cararacterística geral recebida por parâmetro para o projeto atual
  def filter_level_of_influence(general_caracteristic_id)
    @projects_general_caracteristics_level_of_influences = ProjectsGeneralCaracteristicsLevelOfInfluence.find_all_by_project_id(@project.id)
     @level_of_influence = @projects_general_caracteristics_level_of_influences.find{|x| x.general_caracteristic_id == general_caracteristic_id}
     @level_of_influence
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

