json.array!(@movie_participants) do |movie_participant|
  json.extract! movie_participant, :id, :participant_id, :name, :birthplace, :birthdate
  json.url movie_participant_url(movie_participant, format: :json)
end
