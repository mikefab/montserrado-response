json.array!(@orgs) do |org|
  json.extract! org, :id, :name, :nick, :description
  json.url org_url(org, format: :json)
end
