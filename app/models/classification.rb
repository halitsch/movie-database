class Classification < ActiveRecord::Base
	self.primary_key = "movie_id"
	self.primary_key = "genre_id"
	belongs_to :movie
	belongs_to :genre
end