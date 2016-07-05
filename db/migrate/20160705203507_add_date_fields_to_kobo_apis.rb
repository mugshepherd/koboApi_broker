class AddDateFieldsToKoboApis < ActiveRecord::Migration
  def change
    add_column :kobo_apis, :sighting_month, :string
    add_column :kobo_apis, :sighting_year, :string
  end
end
