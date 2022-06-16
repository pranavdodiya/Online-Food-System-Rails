class CreateUserdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :userdetails do |t|
      t.string :username
      t.string :user_address
      t.integer :user_contact_number
      t.string :user_city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :userdetails, :username, unique: true
  end
end
