class KoboApis < ActiveRecord::Migration
  def change
  	create_table :koboApis do |t|
      t.integer :lemurs_quantity
      t.date  :month_and_year
      t.text :_geolocation
      t.text :lemur_category
    end
  end
end
