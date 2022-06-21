class CreateDeliveryMen < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_men do |t|
      t.string :delivaryman_name
      t.string :deliveryman_city
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
