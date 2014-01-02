class User < ActiveRecord::Base
	has_many :rating, foreign_key: :user_id
	has_many :movie, through: :rating
end
