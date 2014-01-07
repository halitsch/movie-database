class Recension < ActiveRecord::Base
	self.primary_keys = 'movie_id', 'website_id'
	belongs_to :website
end
