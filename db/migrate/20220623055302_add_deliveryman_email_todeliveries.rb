class AddDeliverymanEmailTodeliveries < ActiveRecord::Migration[7.0]
  def change
    add_column :deliveries, :deliveryman_email, :string
  end
end
