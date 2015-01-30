class Person < ActiveRecord::Base
  has_and_belongs_to_many :teams, :join_table => "people_teams"

end
