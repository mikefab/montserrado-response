class TeamPeopleNoContactSerializer < ActiveModel::Serializer
  attributes :name, :org, :tasks, :epi_codes, :ordered_people_no_contact, :zone_ids, :people_positions, :supporting_partners_no_contact
end