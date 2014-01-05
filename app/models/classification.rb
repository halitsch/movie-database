class Classification < ActiveRecord::Base
	self.primary_key = "movie_id"
	self.primary_key = "genre_id"
	belongs_to :movie, foreign_key: :movie_id
	belongs_to :genre, foreign_key: :genre_id
end