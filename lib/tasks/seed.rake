namespace :csv do
  task :import_epi_zones => [:environment] do
    basedir = Rails.root.to_s + "/lib/csv"

    File.open("#{basedir}/epi_zone.shp_epi_zone.shp.csv") do |zones|
      zones.read.each_line do |z|
        geometry = z.chomp.split(/",/)[0]
        x,objectID,epi_code,shape_leng,shape_area,cnam,x,x = z.chomp.split(/",/)[1].split(",")
        Zone.create!(geometry: geometry, objectID: objectID, epi_code: epi_code, shape_leng: shape_leng, shape_area: shape_area, cnam: cnam)             
      end
    end
  end
end