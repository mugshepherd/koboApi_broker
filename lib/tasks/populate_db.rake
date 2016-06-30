namespace :populate do
  desc 'populate db with geographic data'
  task data: :environment do
    require 'rgeo-shapefile'
    RGeo::Shapefile::Reader.open('//Users/toby/code/projects/lemurSurvey/data/geodata/MDG_adm_shp/MDG_adm1.shp', :factory => MySpatialTable::FACTORY) do |file|

      # see the file content
      puts "file: #{file.inspect}"
      # we need to extract the data from this file object and
      # then create the record with that data using
      # MySpatialTable.create(:polygon_data => data_from_file)
      # try 1: didn't work
      # file.each do |record|
      #   record.geometry.projection.each do |poly|
      #     puts poly
      #   end
      # end

      # try 2: didn't work
      # MySpatialTable.create(:polygon_data => file)

      # try 3: didn't work
      # record.geometry.projection.each do |poly|
      #   MySpatialTable.create(:polygon_data => poly)
      # end
    end
  end
end
