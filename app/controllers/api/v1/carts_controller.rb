module Api
    module V1
      class CartsController < ApplicationController

        #before_action :authenticate_user!
        
        #GET /users
        def index
            if params[:user_id]
                @cart=Cart.find_by(user_id: params[:user_id])
            end
            # @carts=Cart.all
            render json: @cart , status: :ok
        end

        #GET /users/{username}
        def show
            render json: @cart, status: :ok
        end

        #POST /users
        def create
            p params
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
            # @cart = Cart.find(params[:cart_id])
            # cart_params
            #p request.body[:cart_obj],"--------------------"
            @cart=Cart.find(params[:id])
            # raise params.to_s
            # p params[:cart_obj]
            # debbuger
            if @cart.update(cart_obj: params[:cart_obj])
                render json: {status: 'SUCCESS', message: 'item is updated', data:@cart}, status: :ok
            else
                render json: {status: 'Error', message: 'item  is not updated', data:@cart.errors}, status: :unprocessable_entity
            end
        end

        #DELETE /users/{username}
        def destroy
            @cart= Cart.find(params[:id])
            @cart.destroy
        end
        private

            def cart_params
            
                params.permit(:cart_obj)
            end

            # def set_cart
            #     @cart= Cart.find(params[:id])
            # end
        
  
      end
    end
  end