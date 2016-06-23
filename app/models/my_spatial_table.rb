class MySpatialTable < ActiveRecord::Base
  self.table_name = "my_spatial_table"

  FACTORY = RGeo::Geographic.simple_mercator_factory
  # set_rgeo_factory_for_column(:polygon_data, FACTORY.projection_factory)
end
