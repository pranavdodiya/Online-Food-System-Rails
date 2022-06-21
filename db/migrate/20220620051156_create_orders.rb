class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text :address
      t.integer :item_id
      t.boolean :status, default: false
      t.integer :item_quantity

      t.timestamps
    end
  end
end
