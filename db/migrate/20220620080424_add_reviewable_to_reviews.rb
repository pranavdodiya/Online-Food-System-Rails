class AddReviewableToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :reviewable, polymorphic: true, null: false
    add_reference :reviews, :restaurant, foreign_key: true
    add_reference :reviews, :item, foreign_key: true
    add_reference :reviews, :user, foreign_key: true
  end
end
