 class ProjectsGeneralCaracteristicsLevelOfInfluence < ActiveRecord::Base
   unloadable

  belongs_to :project
  belongs_to :general_caracteristic
  belongs_to :level_of_influence

end

