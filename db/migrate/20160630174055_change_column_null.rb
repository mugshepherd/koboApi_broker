class ChangeColumnNull < ActiveRecord::Migration
  def change
  	change_column_null :kobo_apis, :month_and_year, true
  end
end
