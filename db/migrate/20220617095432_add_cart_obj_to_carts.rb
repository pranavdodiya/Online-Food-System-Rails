class AddCartObjToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :cart_obj, :json
  end
end
