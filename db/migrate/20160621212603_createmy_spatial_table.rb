class CreatemySpatialTable < ActiveRecord::Migration
  def change
  	create_table :my_spatial_table do |t|
		  t.st_polygon :polygon_data, geographic: true
		end
  end
end
