class CartoonsController < ApplicationController

	def index
    @cartoons = Video.cartoon.sorted.page(params[:page]).per(30)
	end

	def show
		@cartoon = Video.find(params[:id])
	end
end
