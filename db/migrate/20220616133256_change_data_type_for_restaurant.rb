class ChangeDataTypeForRestaurant < ActiveRecord::Migration[7.0]
  def change
    change_column(:restaurants, :restaurant_contact_number, :string)
  end
end
