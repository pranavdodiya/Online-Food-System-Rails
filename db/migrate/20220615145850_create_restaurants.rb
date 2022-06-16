class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.string :restaurant_address
      t.integer :restaurant_contact_number
      t.text :restaurant_description
      t.string :restaurant_city
      t.string :restaurant_email

      t.timestamps
    end
  end
end
