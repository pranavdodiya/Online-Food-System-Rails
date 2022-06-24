class AddRestaurantAddressToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :restaurant_address, :text
  end
end
