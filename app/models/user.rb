class User < ActiveRecord::Base
	self.primary_key = "user_id"
	has_many :rating
	has_many :movie, through: :rating
end
