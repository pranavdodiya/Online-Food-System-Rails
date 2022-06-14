class CreateFooditems < ActiveRecord::Migration[7.0]
  def change
    create_table :fooditems do |t|
      t.string :item_name
      t.integer :price
      t.string :category
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
