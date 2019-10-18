class MoviesController < ApplicationController
	def index
		@movies = Movie.all 
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end


	def update
		@movie = Movie.find(params[:id])

		if @movie.update(movie_params)
			redirect_to @movie
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
			redirect_to @movie
		else
			render :new
		end
	end
	private
	def movie_params
		params.require(:movie).permit(:title,:total_gross, :description, :released_on)
	end
end
