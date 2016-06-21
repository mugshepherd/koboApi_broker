class CreatePostgisExtension < ActiveRecord::Migration
	def up
	  execute "CREATE EXTENSION IF NOT EXISTS postgis;"
	end
end
