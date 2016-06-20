class KoboDataController < ApplicationController

def index
		@kobo_info = KoboApi.get_api_info
		puts "@kobo_info: #{@kobo_info.inspect}"
		@kobo_info.each do |kobo_info|
		  begin
		  	#this pulls in new records that have been added to the api and adds them to the database.  it doesn't pull in records from the api that are already in the db
		    KoboApi.find_or_create_by(lemurs_quantity: kobo_info['lemurs_quantity'], month_and_year:  Date.parse(kobo_info['month_and_year']), _geolocation: kobo_info['_geolocation'])
		  #some of my records don't have valid date values, so `rescue` is added to keep rails from returning a `notfound` page.  quick tutorial here:  http://www.rubytutorial.io/rails-rescue_from/
		  rescue 
		    puts "rescued"
		  end
		end
		#i needed to update my render logic.  see addition of `each_serializer` here.  @kobo_info has also changed to KoboApi.all as well.
    render(
      json: KoboApi.all,
      each_serializer: KoboApiSerializer
    )
	end
end

