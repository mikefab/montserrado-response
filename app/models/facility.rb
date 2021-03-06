class Facility < ActiveRecord::Base
  belongs_to :zone

  LEVELS = ['Health Center', 'Hospital', 'PHC-1', 'PHC-2']


  def self.seed_data
    load File.join(Rails.root, 'Rakefile')
    Rake::Task['import_facilities'].invoke
  end

  def zone_code
    if self.zone
      self.zone.epi_code
    else
      nil
    end
  end

end
