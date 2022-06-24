class Restaurant < ApplicationRecord
    has_many :items
    has_one_attached :rest_image
    has_many :reviews, :as => :reviewable
    validates :user_id, uniqueness: true
end
