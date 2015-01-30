class Task < ActiveRecord::Base
  has_and_belongs_to_many :teams, :join_table => "tasks_teams"

  def self.db_seed
    [
      'Facility Assessment',
      'Training for healthcare',
      'Safe Burials',
      'Contact tracing',
      'Case investigation'
    ].each do |task|
      Task.create!(name: task)
    end
  end
end
