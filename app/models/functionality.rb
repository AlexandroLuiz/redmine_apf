class Functionality < ActiveRecord::Base
  unloadable

  belongs_to :project
  belongs_to :type_of_functionality

  validates_presence_of :name
  validates_presence_of :type_of_functionality_id
  validates_presence_of :qnt_type_data

  validates_presence_of :project_id
end

