class User < ApplicationRecord
	has_secure_password
	
	validates :name, presence: true
	validates :username, length: { minimum: 5 }, allow_blank: true, uniqueness: true

  validates :email, presence: true,
                    format: /\A\S+@\S+\z/,
                    uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 10, allow_blank: true }


	has_many :favourites, dependent: :destroy
  has_many :favourite_movies, through: :favourites, source: :movie


  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
	end
end
