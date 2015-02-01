class PeopleSerializer < ActiveModel::Serializer
  attributes :full_name, :phone, :email, :is_supervisor
end