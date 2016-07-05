class KoboDataController < ApplicationController

def index
		@kobo_info = KoboApi.get_api_info
		# puts "@kobo_info: #{@kobo_info.inspect}"
		puts "!!![count from api] @kobo_info count: #{@kobo_info.count}"
		puts "!!![count from database] @kobo_info count: #{KoboApi.all.count}" 
		@kobo_info.each do |kobo_info|
			puts "kobo_info: #{kobo_info.inspect}"
		  # begin
		  	# #this pulls in new records that have been added to the api and adds them to the database.  it doesn't pull in records from the api that are already in the db

		  #note use of .split(",").map method for geolocation, if used	
		   #  KoboApi.find_or_create_by(lemurs_quantity: kobo_info['lemurs_quantity'], month_and_year:  Date.parse(kobo_info['month_and_year']), _geolocation: kobo_info['_geolocation'].split(",").map { |s| s.to_i }, lemur_category: kobo_info['lemur_category'], location_admin1: kobo_info['location_admin1'], location_admin2: kobo_info['location_admin2'])
		   # date = if kobo_info['month_and_year']
		   # 		Date.parse(kobo_info['month_and_year'])
		   # else
		   # 		nil
		   # end


		    KoboApi.find_or_create_by(record_id: kobo_info['_id'], lemurs_quantity: kobo_info['lemurs_quantity'], sighting_month: kobo_info['sighting_month'], sighting_year: kobo_info['sighting_year'], lemur_category: kobo_info['lemur_category'], location_admin1: kobo_info['location_admin1'], location_admin2: kobo_info['location_admin2'])

		  #if dates don't have valid values, use `rescue` to keep rails from returning a `notfound` page.  quick tutorial here:  http://www.rubytutorial.io/rails-rescue_from/
		  # rescue 
		  #   puts "rescued"
		  # end
		end
		#i needed to update my render logic.  see addition of `each_serializer` here.  @kobo_info has also changed to KoboApi.all as well.
    render(	
      json: KoboApi.all,
      each_serializer: KoboApiSerializer
    )
	end
end

