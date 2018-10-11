class MoviesController < ApplicationController

	def index
    @movies = Video.movie.limit(10)
	end

	def show
		@movie = Video.find(params[:id])
	end
end
