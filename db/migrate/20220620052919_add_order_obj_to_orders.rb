class AddOrderObjToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :order_obj, :json
  end
end
