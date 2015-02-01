class Team < ActiveRecord::Base
  belongs_to :org
  has_and_belongs_to_many :zones,  :join_table => "teams_zones"
  has_and_belongs_to_many :tasks,  :join_table => "tasks_teams"
  has_and_belongs_to_many :people, :join_table => "people_teams"

  validates_presence_of :name


  def epi_codes
  	self.zones.map(&:epi_code)
  end
end
