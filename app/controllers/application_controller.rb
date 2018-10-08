class ApplicationController < ActionController::Base
	before_action :set_http_referrer

	def set_http_referrer
		request.env["HTTP_REFERER"] = "https://list.iqiyi.com"
	end
end
