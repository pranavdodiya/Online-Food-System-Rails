class RestaurantMailer < ApplicationMailer
    def new_restaurant_email
        p "hiiiiii"
        @restaurant = params[:restaurant]
        p @restaurant
        mail(to: @restaurant.restaurant_email, subject: "You got a new added!")
    end
end
