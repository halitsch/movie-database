json.array!(@media) do |medium|
  json.extract! medium, :id, :med_id, :med_type, :movie_id, :medium_set_id
  json.url medium_url(medium, format: :json)
end
