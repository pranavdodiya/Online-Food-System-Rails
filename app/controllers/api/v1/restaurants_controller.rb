module Api
    module V1
      class RestaurantsController < ApplicationController
        

       # before_action :set_restaurant, except:[:index,:create] 
        

        #GET /users
        def index
            @restaurants=Restaurant.all
            render json: @restaurants , status: :ok
        end

        #GET /users/{username}
        def show
            @restaurant = Restaurant.find(params[:id])
            render json: @restaurant, status: :ok
        end

        #POST /users
        def create
            
            @restaurant = Restaurant.new(restaurant_params)
            if @restaurant.save!
                render json: @restaurant, status: :created
            else 
                render json: { errors: @restaurant.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        #PUT /users/{username}
        def update

            @restaurant = Restaurant.find(params[:id])

            if @restaurant.update_attributes(restaurant_params)
            render json: {status: 'SUCCESS', message: 'restaurant is updated', data:@restaurant}, status: :ok
            else
            render json: {status: 'Error', message: 'restaurant is not updated', data:@restaurant.errors}, status: :unprocessable_entity
            end

        end

        #DELETE /users/{username}
        def destroy
            @restaurant = Restaurant.find(params[:id])
            @restaurant.destroy
        end

        private

            def restaurant_params
                params.permit(:restaurant_name, :restaurant_email, :restaurant_contact_number, :restaurant_address, :restaurant_city, :rest_image)
            end

            # def set_restaurant
            #     @restaurant = Restaurant.find(params[:id])
            # end
        
  
      end
    end
  end