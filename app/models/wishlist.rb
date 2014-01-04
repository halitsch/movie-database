class Wishlist < ActiveRecord::Base
	has_many :movie, foreign_key: :movie_id
	has_many :loan, foreign_key: :wis_id
	has_many :user, foreign_key: :user_id
end
