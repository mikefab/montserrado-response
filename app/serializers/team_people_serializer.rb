class TeamPeopleSerializer < ActiveModel::Serializer
  attributes :name, :org, :tasks, :epi_codes, :ordered_people, :zone_ids, :people_positions
end