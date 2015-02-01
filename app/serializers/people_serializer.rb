class PeopleSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :phone, :email, :is_supervisor
end