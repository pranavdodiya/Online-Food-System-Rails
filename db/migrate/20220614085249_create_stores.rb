class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :number
      t.text :address
      t.text :information

      t.timestamps
    end
  end
end
