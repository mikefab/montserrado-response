json.array!(@facilities) do |facility|
  json.extract! facility, :id, :zone_id, :contact_numbers, :name, :location, :contact_name, :beds, :lat, :lon, :level
  json.url facility_url(facility, format: :json)
end
