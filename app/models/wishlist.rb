class Wishlist < ActiveRecord::Base
	has_many :movie, foreign_key: :movie_id
	has_many :loan, foreign_key: :wis_id
	belongs_to :user, foreign_key: :user_id
end
