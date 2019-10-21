class Movie < ApplicationRecord
	validates :title, :released_on, :duration, presence: true
	validates :description, length: {minimum: 25}
	validates :total_gross, numericality: { greater_than_or_equal: 0}

	validates :image_file_name, allow_blank: true, format: {
		with:    /\w+\.(gif|jpg|png)\z/i,
		message: "must reference a GIF, JPG, or PNG image"
	}

	has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy

	has_many :favourites, dependent: :destroy
	has_many :fans, through: :favourites, source: :user
	has_many :characterizations, dependent: :destroy
	has_many :genres, through: :characterizations


	RATINGS = %w(G PG PG-13 R NC-17)

validates :rating, inclusion: { in: RATINGS }

	def self.released
		where("released_on <= ?", Time.now).order("released_on desc")
	end

	scope :hits, -> { released.where('total_gross >= 300000000').order(total_gross: :desc) }
	scope :flops, -> { released.where('total_gross < 50000000').order(total_gross: :asc) }
	scope :upcoming, -> {  where("released_on > ?", Time.now).order(released_on: :asc) }
	scope :recent, ->(max=5) { released.limit(max) }
	scope :rated, ->(rating) { released.where(rating: rating) }
	scope :by_name, -> { order(:name) }
	scope :not_admins, -> { by_name.where(admin: false) }
	scope :past_n_days, ->(days) { where('created_at >= ?' , days.days.ago) }
	scope :grossed_less_than, ->(amount) { released.where('total_gross < ?', amount) }
	scope :grossed_greater_than, ->(amount) { released.where('total_gross > ?', amount) }

	def self.recently_added
		order('created_at desc').limit(3)
	end

	def flop?
		total_gross.blank? || total_gross < 50000000
	end

	def average_stars
		reviews.average(:stars)
	end

	def recent_reviews
		reviews.order('created_at desc').limit(2)
	end
end
