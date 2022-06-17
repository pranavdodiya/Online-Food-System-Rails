class Restaurant < ApplicationRecord
    has_many :items
    has_one_attached :rest_image
    #has_many :items,foreign_key: "restaurants_id",dependent: :destroy
end
