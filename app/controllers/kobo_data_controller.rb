class KoboDataController < ApplicationController

	def index
		@kobo_info = KoboApi.get_api_info
		render json: @kobo_info
	end

end
