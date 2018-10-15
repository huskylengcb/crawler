class MoviesController < ApplicationController

	def index
    @movies = Video.movie.sorted.page(params[:page]).per(30)
	end

	def show
		@movie = Video.find(params[:id])
	end
end
