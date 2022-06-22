class Item < ApplicationRecord
  belongs_to :restaurant
  has_and_belongs_to_many :carts
  has_many :cartitems
  has_many_attached :foodimages
  has_many :reviews, :as => :reviewable 
  # belongs_to :order
end

