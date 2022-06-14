class CreateJoinTableCartFooditem < ActiveRecord::Migration[7.0]
  def change
    create_join_table :carts, :fooditems do |t|
       t.index [:cart_id, :fooditem_id]
      # t.index [:fooditem_id, :cart_id]
    end
  end
end
