class Loan < ActiveRecord::Base
	belongs_to :wishlist, foreign_key: :wis_id
	has_many :movie, through: :wishlist
	has_many :user, through: :wishlist
end
