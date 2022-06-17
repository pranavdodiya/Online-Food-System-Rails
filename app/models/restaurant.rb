class Restaurant < ApplicationRecord
    has_many :items ,dependent: :destroy
    has_one_attached :rest_image,dependent: :destroy
    #has_many :items,foreign_key: "restaurants_id",dependent: :destroy
end
