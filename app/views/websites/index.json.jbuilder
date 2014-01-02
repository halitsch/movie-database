json.array!(@websites) do |website|
  json.extract! website, :id, :website_id, :name, :url
  json.url website_url(website, format: :json)
end
