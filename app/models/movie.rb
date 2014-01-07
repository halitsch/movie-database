class Movie < ActiveRecord::Base
	has_many :comment
	has_many :classification, foreign_key: :movie_id
	has_many :genre, through: :classification
	has_many :rating
	has_many :user, through: :rating
	has_many :contribution, foreign_key: :movie_id
	has_many :movie_participant, through: :contribution
	has_many :medium, foreign_key: :movie_id
	has_many :recension, foreign_key: :movie_id
	has_many :website, through: :recension
	has_many :wishlist
	has_many :loan, through: :wishlist
end
