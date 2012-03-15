module ProjectsGeneralCaracteristicsLevelOfInfluencesHelper
  include GlobalHelper

  def filter_projects_general_caracteristics_level_of_influences(general_caracteristic_id)
      @projects_general_caracteristics_level_of_influences = ProjectsGeneralCaracteristicsLevelOfInfluence.find_all_by_project_id(@project.id)
     @projects_general_caracteristics_level_of_influence = @projects_general_caracteristics_level_of_influences.index{|x| x.general_caracteristic_id == general_caracteristic_id}
    if(@level_of_influence == nil)
     "Ainda não ajustado"
   else
     "#{@projects_general_caracteristics_level_of_influence.level_of_influence.level} #{@projects_general_caracteristics_level_of_influence.level_of_influence.description}"
   end
  end

  def filter_level_of_influence(general_caracteristic_id)
    @projects_general_caracteristics_level_of_influences = ProjectsGeneralCaracteristicsLevelOfInfluence.find_all_by_project_id(@project.id)
     @level_of_influence = @projects_general_caracteristics_level_of_influences.index{|x| x.general_caracteristic_id == general_caracteristic_id}
     @level_of_influence
  end
end

