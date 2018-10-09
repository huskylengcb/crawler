require 'open-uri'

class HomepagesController < ApplicationController
	def show
    @movies = Movie.sorted.limit(10)
	end
end

