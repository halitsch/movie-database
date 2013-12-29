class Movie < ActiveRecord::Base
	has_many :comment
	has_many :classification
	has_many :genre, through: :classification
end
