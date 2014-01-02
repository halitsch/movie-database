class Website < ActiveRecord::Base
	has_many :recension, foreign_key: :movie_id
	has_many :movie, through: :recension
end