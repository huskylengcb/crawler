class TeleplaysController < ApplicationController

	def index
    @teleplays = Video.teleplay.limit(10)
	end

	def show
		@teleplay = Video.find(params[:id])
	end
end
