json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :middle_name, :last_name, :email, :phone, :team_id
  json.url person_url(person, format: :json)
end
