class AddReferencesToFooditems < ActiveRecord::Migration[7.0]
  def change
    add_reference :fooditems, :store, null: false, foreign_key: true
  end
end
