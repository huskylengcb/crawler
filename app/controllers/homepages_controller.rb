require 'open-uri'

class HomepagesController < ApplicationController
	def show
    @movies = Video.movie.sorted.limit(10)
	end
end

