class AddItemSecureUrlToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :item_secure_url, :string
  end
end
