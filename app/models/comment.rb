class Comment < ActiveRecord::Base
	#in the database is more complicated key, it is comprised from user_id, movie_id and time
	self.primary_key = "user_id"
	self.primary_key = "movie_id"
	belongs_to :movie, class_name: "Movie", foreign_key: "movie_id"
end