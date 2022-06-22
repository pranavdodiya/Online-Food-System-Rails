class Item < ApplicationRecord
  belongs_to :restaurant
  #belongs_to :restaurant, class_name: "Restaurant", foreign_key: "restaurants_id"
  has_and_belongs_to_many :carts
  has_many :cartitems
  has_many_attached :foodimages
  has_many :reviews, :as => :reviewable 
  
end
#belongs_to :user, class_name: "User", foreign_key: "users_id"
#has_many :user_cvs,foreign_key: "users_id",dependent: :destroy
