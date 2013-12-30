class Rating < ActiveRecord::Base
	self.primary_key = "movie_id"
	self.primary_key = "user_id"
	belongs_to :movie
	belongs_to :user
end