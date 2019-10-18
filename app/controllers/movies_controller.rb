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

	private
	def movie_params
		params.require(:movie).permit(:title,:total_gross, :description, :released_on)
	end
end
