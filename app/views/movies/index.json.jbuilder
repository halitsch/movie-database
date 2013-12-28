json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :release_day, :release_month, :release_year, :duration, :budget, :revenue, :description, :ageRestriction
  json.url movie_url(movie, format: :json)
end
