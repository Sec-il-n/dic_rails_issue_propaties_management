class ChangeColumnsAddNotnullOnStations < ActiveRecord::Migration[5.2]
  def change
    change_column_null :stations, :line, false 
    change_column_null :stations, :station_name, false
  end
end
