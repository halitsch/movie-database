class Movie < ActiveRecord::Base
	has_many :comment
end
