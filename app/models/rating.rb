class Rating < ActiveRecord::Base
	self.primary_keys = :movie_id, :user_id
	belongs_to :movie
	belongs_to :user
end