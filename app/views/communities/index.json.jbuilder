json.array!(@communities) do |community|
  json.extract! community, :id, :name, :zone_id, :description, :notes
  json.url community_url(community, format: :json)
end
