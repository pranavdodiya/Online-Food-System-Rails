module Api
    module V1
      class ExamplesController < ApplicationController

        #before_action :authenticate_user!
        
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
            
            @example = Example.new(example_params)
            if @example.save!
                render json: @example, status: :created
            else 
                render json: { errors: @example.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        #PUT /users/{username}
        def update
            # @cart = Cart.find(params[:cart_id])
            # cart_params
            #p request.body[:cart_obj],"--------------------"
            @example=Example.find(params[:id])
            #raise params.to_s
            #p params[:cart_obj]
            #debbuger
            if @example.update(obj: params[:obj])
            render json: {status: 'SUCCESS', message: 'item is updated', data:@example}, status: :ok
            else
            render json: {status: 'Error', message: 'item  is not updated', data:@example.errors}, status: :unprocessable_entity
            end
        end

        #DELETE /users/{username}
        def destroy
            @cart= Cart.find(params[:id])
            @cart.destroy
        end
        private

            def example_params
            
                params.permit(:name, :obj)
            end

            # def set_cart
            #     @cart= Cart.find(params[:id])
            # end
        
  
      end
    end
  end