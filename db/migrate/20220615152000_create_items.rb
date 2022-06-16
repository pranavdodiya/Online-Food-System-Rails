class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.integer :item_price
      t.string :item_category
      t.string :item_status
      t.text :item_description
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
