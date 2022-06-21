class OrderMailer < ApplicationMailer
    def new_order_email
        @order = params[:order]
        p @restaurant
        # mail(to: restaurant_email, subject: "You got a new added!")
    end
end