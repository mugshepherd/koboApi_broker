# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
		@kobo_info = KoboApi.get_api_info
		@kobo_info.each do |kobo_info|
		  begin
		  	#this pulls in new records that have been added to the api and adds them to the database.  it doesn't pull in records from the api that are already in the db
		    KoboApi.create(lemurs_quantity: kobo_info['lemurs_quantity'], month_and_year:  Date.parse(kobo_info['month_and_year']), _geolocation: kobo_info['_geolocation'], lemur_category: kobo_info['lemur_category'], location_admin1: kobo_info['location_admin1'], location_admin2: kobo_info['location_admin2'])
		  #some of my records don't have valid date values, so `rescue` is added to keep rails from returning a `notfound` page.  quick tutorial here:  http://www.rubytutorial.io/rails-rescue_from/
		  rescue 
		    puts "rescued"
		  end
		end