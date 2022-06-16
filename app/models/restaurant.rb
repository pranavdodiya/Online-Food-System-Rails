class Restaurant < ApplicationRecord
    has_many :items
    #has_many :items,foreign_key: "restaurants_id",dependent: :destroy
end
