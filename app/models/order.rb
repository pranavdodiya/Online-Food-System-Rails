class Order < ApplicationRecord
    has_many :items
    before_create :set_delivery_id
    belongs_to :user


    validates :address, presence: true
    validates :item_quantity, presence: true


    private

    def set_delivery_id
        self.delivery_id=Delivery.all.sample.id
    end

end
