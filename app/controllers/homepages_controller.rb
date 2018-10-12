require 'open-uri'

class HomepagesController < ApplicationController
	def show
    @movies = Video.movie.sorted.limit(10)
    @teleplays = Video.teleplay.sorted.limit(10)
    @cartoons = Video.cartoon.sorted.limit(10)
	end
end

