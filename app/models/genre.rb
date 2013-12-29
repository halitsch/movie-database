class Genre < ActiveRecord::Base
	has_many :classification
	has_many :movie, through: :classification
end
