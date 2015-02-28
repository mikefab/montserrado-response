class Community < ActiveRecord::Base
  belongs_to :zone

  def zone_code
    self.zone.epi_code
  end

  def self.db_seed
    load File.join(Rails.root, 'Rakefile')
    Rake::Task['import_communities'].invoke
  end
end
