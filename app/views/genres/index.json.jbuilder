json.array!(@genres) do |genre|
  json.extract! genre, :id, :genre_id, :name, :parentID
  json.url genre_url(genre, format: :json)
end
