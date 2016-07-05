class AddRecordIdToKoboApis < ActiveRecord::Migration
  def change
    add_column :kobo_apis, :record_id, :integer
  end
end
