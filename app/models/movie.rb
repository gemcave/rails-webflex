class Movie < ApplicationRecord
	validates :title, :released_on, :duration, presence: true
	validates :description, length: {minimum: 25}
	validates :total_gross, numericality: { greater_than_or_equal: 0}

	validates :image_file_name, allow_blank: true, format: {
		with:    /\w+\.(gif|jpg|png)\z/i,
		message: "must reference a GIF, JPG, or PNG image"
	}

	has_many :reviews, dependent: :destroy

	RATINGS = %w(G PG PG-13 R NC-17)

validates :rating, inclusion: { in: RATINGS }

	def flop?
		total_gross.blank? || total_gross < 5000000
	end

	def self.released
    where("released_on <= ?", Time.now).order("released_on desc")
	end

	def average_stars
		reviews.average(:stars)
	end
	
	def recent_reviews
		reviews.order('created_at desc').limit(2)
	end
end
