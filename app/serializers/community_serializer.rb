class CommunitySerializer < ActiveModel::Serializer
  attributes :id, :name, :zone_id, :zone_code, :description, :notes
end
