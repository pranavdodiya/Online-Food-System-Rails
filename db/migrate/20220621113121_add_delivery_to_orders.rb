class AddDeliveryToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :delivery, null: false, foreign_key: true
  end
end
