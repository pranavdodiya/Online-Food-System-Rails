class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :deliveryman_name
      t.string :deliveryman_city
      t.string :deliveryman_number
      t.boolean :delivery_status, default: false

      t.timestamps
    end
  end
end
