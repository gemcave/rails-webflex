class MoviesController < ApplicationController
	before_action :set_movie, only: [:show,:update,:edit,:destroy]

	def index
		@movies = Movie.all
	end

	def show
		@fans = @movie.fans

		if current_user
			@current_favorite = current_user.favourites.find_by(movie_id: @movie.id)
		end

		@genres = @movie.genres
	end

	def edit
	end


	def update
		if @movie.update(movie_params)
			redirect_to @movie, notice: "Movie successfully updated!"
		else
			render :edit
		end
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			redirect_to @movie, notice: "Movie successfully created!"
		else
			render :new
		end
	end

	def destroy
		if @movie.destroy
			redirect_to movies_url, alert: "Movie successfully deleted!"
		else
			render :show
		end
	end
	private
	def movie_params
		params.require(:movie).permit(:title, :total_gross, :rating, :description, :released_on, :director,:duration, :cast, :image_file_name,genre_ids: [])
	end

	def set_movie
		@movie = Movie.find(params[:id])
	end
end
