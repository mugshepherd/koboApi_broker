class KoboDataController < ApplicationController

	def index
		@kobo_info = KoboApi.get_api_info
		# respond_to :json
	end

end
