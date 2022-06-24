class Changecolnameinorders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :item_id, :restaurant_id
  end
end
