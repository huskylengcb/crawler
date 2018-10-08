require 'open-uri'

class HomepagesController < ApplicationController
	def show
    @movies = Movie.limit(10)
	end
end

