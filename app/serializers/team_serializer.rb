class TeamSerializer < ActiveModel::Serializer
  attributes :name, :org, :tasks, :epi_codes, :people, :zone_ids
end