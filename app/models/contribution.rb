class Contribution < ActiveRecord::Base
	belongs_to :movie, foreign_key: :movie_id, primary_key: :movie_id
	belongs_to :movie_participant, foreign_key: :participant_id, primary_key: :participant_id
end