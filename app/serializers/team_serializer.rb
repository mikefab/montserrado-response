class TeamSerializer < ActiveModel::Serializer
  attributes :name, :org, :tasks, :epi_codes, :zone_ids
end