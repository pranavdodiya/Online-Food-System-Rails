class Cart < ApplicationRecord
  belongs_to :user 
  validates :user_id, uniqueness: true
  has_many :cartitems
  has_and_belongs_to_many :items
end
