require 'rake'  
class Zone < ActiveRecord::Base
  has_and_belongs_to_many :teams, :join_table => "teams_zones"
  
  def self.seed_data
    Rake::Task['csv:import_epi_zones'].invoke
  end
end
