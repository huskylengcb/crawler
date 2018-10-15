class TeleplaysController < ApplicationController

	def index
    @teleplays = Video.teleplay.sorted.page(params[:page]).per(30)
	end

	def show
		@teleplay = Video.find(params[:id])
	end
end
