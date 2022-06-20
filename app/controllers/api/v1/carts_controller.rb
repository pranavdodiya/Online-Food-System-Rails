module Api
    module V1
      class CartsController < ApplicationController

       before_action :authenticate_user!
        
        #GET /users
        def index
            @carts=Cart.all
            render json: @carts , status: :ok
        end

        #GET /users/{username}
        def show
            render json: @cart, status: :ok
        end

        #POST /users
        def create
            @cart = Cart.new(cart_params)
            if @cart.save!
                render json: @cart, status: :created
            else 
                render json: { errors: @cart.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        #PUT /users/{username}
        def update
            @cart = Cart.find(params[:cart_id])

            if @cart.update(cart_obj: params[:cart_obj])
            render json: {status: 'SUCCESS', message: 'item is updated', data:@cart}, status: :ok
            else
            render json: {status: 'Error', message: 'item  is not updated', data:@cart.errors}, status: :unprocessable_entity
            end
            render json: @cart ,status: :ok
        end 

        #DELETE /users/{username}
        def destroy
            @cart= Cart.find(params[:id])
            @cart.destroy
        end
        private

            def cart_params
                params.permit(:user_id,)
            end

            # def set_cart
            #     @cart= Cart.find(params[:id])
            # end
        
  
      end
    end
  end