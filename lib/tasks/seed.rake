  task :import_communities => [:environment] do
    f = File.new(Rails.root + 'lib/tasks/communities.txt')
    zone = String.new

    while (line = f.gets)
      if line.match(/[a-zA-Z0-9]/)
        zone_code = line.split(/\s+/)[0].strip
        if Zone.zone_hash[zone_code]
          zone_code = line.split(/\s+/)[0].strip 
          zone = Zone.find_by_epi_code(zone_code)
        else
          Community.find_or_initialize_by(zone_id: zone.id, name: line.strip).save!
        end
      end
    end
  end


  task :import_facilities => [:environment] do
    f = File.new(Rails.root + 'lib/tasks/facilities.txt')
    while (line = f.gets)
      puts line
      line = line.split(/\t/)
      zone, contact_numbers, name, location = line[1..4]
      zone_id = Zone.where(epi_code: zone).length != 0 ? Zone.where(epi_code: zone)[0].id : nil
      Facility.find_or_initialize_by(
        zone_id: zone_id,
        name:    name,
        contact_numbers: contact_numbers,
        location:        location
      ).save!
    end
  end
