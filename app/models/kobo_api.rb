class KoboApi < ActiveRecord::Base

	require 'rest_client'

	USERNAME = ENV['KOBO_API_USER']
	PASSWORD = ENV['KOBO_API_PWD']
	SURVEY = ENV['KOBO_API_SURVEY']
	API_BASE_URL = ENV['API_BASE_URL']

	def self.get_api_info
		uri = "#{API_BASE_URL}/data/#{SURVEY}?format=json"
		rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
		response = rest_resource.get
		JSON.parse response
	end
end
