 class ProjectsGeneralCaracteristicsLevelOfInfluence < ActiveRecord::Base
   unloadable

  belongs_to :project
  belongs_to :general_caracteristic
  belongs_to :level_of_influence

  validates_presence_of :project
  validates_presence_of :level_of_influence
  validates_presence_of :general_caracteristic

end

