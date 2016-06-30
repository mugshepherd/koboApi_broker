class AddDetailsToKoboApis < ActiveRecord::Migration
  def change
    add_column :kobo_apis, :location_admin1, :string
    add_column :kobo_apis, :location_admin2, :string
  end
end
