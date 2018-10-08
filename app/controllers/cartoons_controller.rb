class CartoonsController < ApplicationController

	def index
    @movies = Movie.limit(10)
	end

	def show
		@movie = Movie.find(params[:id])
	end
end
