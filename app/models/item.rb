class Item < ApplicationRecord
  belongs_to :restaurants
  has_and_belongs_to_many :carts
  has_many :cartitems
end
