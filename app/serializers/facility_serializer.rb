class FacilitySerializer < ActiveModel::Serializer
  attributes :id, :zone_id, :zone_code, :contact_numbers, :name, :location, :contact_name, :beds, :lat, :lon, :level
end
