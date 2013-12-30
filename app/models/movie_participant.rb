class MovieParticipant < ActiveRecord::Base
	has_many :contribution, foreign_key: :participant_id
	has_many :movie, through: :contribution
end
