class Movie < ActiveRecord::Base
	self.primary_key = "movie_id"
	has_many :comment
	has_many :classification
	has_many :genre, through: :classification
	has_many :rating
	has_many :user, through: :rating
end
