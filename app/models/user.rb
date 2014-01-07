class User < ActiveRecord::Base
	has_many :rating, foreign_key: :user_id
	has_many :movie, through: :rating
	has_many :wishlist, foreign_key: :user_id
	has_many :loan, through: :wishlist
	has_many :comment
	has_many :rating
end
