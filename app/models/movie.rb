class Movie < ActiveRecord::Base
	has_many :comment
	has_many :classification
	has_many :genre, through: :classification
	has_many :rating
	has_many :user, through: :rating
	has_many :contribution, foreign_key: :movie_id
	has_many :movie_participant, through: :contribution
end
