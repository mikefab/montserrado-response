class Task < ActiveRecord::Base
  has_and_belongs_to_many :teams, :join_table => "tasks_teams"

  def self.db_seed
    [
      'Active Case Finding',
      'Case Investigation',
      'Community Engagement',
      'Community Listing',
      'Contact Tracing',
      'Dispatch',
      'Dead Body Management',
      'Disinfection',
      'Food Distribution and Quarantine Care',
      'Health Promotion',
      'Infection Prevention and Control',
      'Psychosocial Support',
      'Sector Leadership',
      'Supporting Partners'





    ].each do |task|
      Task.first_or_initialize(name: task)
    end
  end
end
