class Cart < ApplicationRecord
    has_and_belongs_to_many :fooditems
    belongs_to :user
    has_many :cartitems
end
