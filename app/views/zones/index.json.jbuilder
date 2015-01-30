json.array!(@zones) do |zone|
  json.extract! zone, :id, :description, :name, :objectID, :epi_code, :shape_leng, :shape_area, :cnam, :geometry
  json.url zone_url(zone, format: :json)
end
