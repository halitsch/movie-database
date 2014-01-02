json.array!(@ratings) do |rating|
  json.extract! rating, :id, :movie_id, :user_id, :ratingValue, :time
  json.url rating_url(rating, format: :json)
end
