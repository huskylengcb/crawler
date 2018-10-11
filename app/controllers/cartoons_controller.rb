class CartoonsController < ApplicationController

	def index
    @cartoons = Video.cartoon.limit(10)
	end

	def show
		@cartoon = Video.find(params[:id])
	end
end
