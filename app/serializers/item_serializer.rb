class ItemSerializer < ActiveModel::Serializer
  attributes :id , :item_name, :item_description, :item_category, :item_price 
end
