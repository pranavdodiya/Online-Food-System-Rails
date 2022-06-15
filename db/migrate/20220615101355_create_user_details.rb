class CreateUserDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_details do |t|
      t.string :username
      t.string :user_fullname
      t.string :user_city
      t.string :user_address
      t.integer :user_contact_number

      t.timestamps
    end
    add_index :user_details, :username, unique: true
  end
end
