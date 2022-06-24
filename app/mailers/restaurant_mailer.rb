class RestaurantMailer < ApplicationMailer
    default from: 'Online Order System <purvrajdodia@gmail.com>'
    def new_restaurant_email
    
        @restaurant = params[:restaurant]
        
        mail(to: @restaurant.restaurant_email, subject: "You got a new added!")
    end
end
