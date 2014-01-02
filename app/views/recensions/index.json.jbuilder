json.array!(@recensions) do |recension|
  json.extract! recension, :id, :movie_id, :website_id, :time, :content
  json.url recension_url(recension, format: :json)
end
