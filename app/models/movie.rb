class Movie < ApplicationRecord
	def flop?
		total_gross.blank? || total_gross < 5000000
	end
end
