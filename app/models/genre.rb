class Genre < ActiveRecord::Base
	has_many :classification, foreign_key: :genre_id
	has_many :movie, through: :classification
end
