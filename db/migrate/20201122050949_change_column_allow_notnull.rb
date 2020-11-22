class ChangeColumnAllowNotnull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :stations, :line, true
    change_column_null :stations, :station_name, true
  end
  def down
    change_column_null :stations, :line, false
    change_column_null :stations, :station_name, false
  end
end
