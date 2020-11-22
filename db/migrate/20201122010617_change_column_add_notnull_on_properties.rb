class ChangeColumnAddNotnullOnProperties < ActiveRecord::Migration[5.2]
  def change
    change_column_null :properties, :name, false
    change_column_null :properties, :price, false
    change_column_null :properties, :address, false
    change_column_null :properties, :age, false
  end
end
