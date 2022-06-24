module Api
    module V1
      class RestaurantsController < ApplicationController
        

      
      
        def index
            @restaurants=Restaurant.all
            render json: @restaurants , status: :ok
        end

    
        def show
            @restaurant = Restaurant.find(params[:id])
            render json: @restaurant, status: :ok
        end
        
       
        def create
<<<<<<< HEAD
=======
            
>>>>>>> 4b364f23a9784b5c96acc77a63d22f0abca820f4
            @restaurant = Restaurant.new(restaurant_params)
            if @restaurant.save!
                # RestaurantMailer.with(restaurant: @restaurant).new_restaurant_email.deliver_later
                render json: @restaurant, status: :created
            else 
                render json: { errors: @restaurant.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        def update

            @restaurant = Restaurant.find(params[:id])

            if @restaurant.update(restaurant_params)
            render json: {status: 'SUCCESS', message: 'restaurant is updated', data:@restaurant}, status: :ok
            else
            render json: {status: 'Error', message: 'restaurant is not updated', data:@restaurant.errors}, status: :unprocessable_entity
            end

        end

      
        def destroy
            @restaurant = Restaurant.find(params[:id])
            @restaurant.destroy
            render json: {
                message: 'deleted sucessfully.'
            }
        end

        private

            def restaurant_params
<<<<<<< HEAD
                params.permit(:restaurant_name, :restaurant_email, :restaurant_contact_number, :restaurant_address, :restaurant_city, :rest_image, :restaurant_description, :user_id, :secure_url)
            end        
=======
                params.require(:restaurant_register_data).permit(:restaurant_name, :restaurant_email, :restaurant_contact_number, :restaurant_address, :restaurant_city, :rest_image, :restaurant_description, :user_id, :secure_url)
            end

            # def set_restaurant
            #     @restaurant = Restaurant.find(params[:id])
            # end
        
  
>>>>>>> 4b364f23a9784b5c96acc77a63d22f0abca820f4
      end
    end
  end