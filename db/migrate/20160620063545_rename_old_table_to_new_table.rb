class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
  	 rename_table :koboApis, :kobo_apis
  end
end
