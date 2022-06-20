class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :restaurant_name, :restaurant_city ,:restaurant_description 
  has_many :items

end
