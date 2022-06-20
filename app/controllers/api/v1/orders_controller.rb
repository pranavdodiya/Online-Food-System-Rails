module Api
    module V1
      class OrdersController < ApplicationController

       
        def index
            @orders=Order.all
            render json: @orders , status: :ok
        end

        def show
            @order = Order.find(params[:id])
            render json: @order, status: :ok
        end

       
        def create
            @order = Order.new(order_params)
            if @order.save!
                render json: @order, status: :created
            else 
                render json: { errors: @order.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        def update
            @order = Order.find(params[:id])

            if @order.update(order_params)
            render json: {status: 'SUCCESS', message: 'item is updated', data:@order}, status: :ok
            else
            render json: {status: 'Error', message: 'item  is not updated', data:@order.errors}, status: :unprocessable_entity
            end
        end

   
        def destroy
            @order = Order.find(params[:id])
            @order.destroy
        end
        private

            def order_params
                params.permit(:address, :item_id, :item_quantity, :status)
            end

            # def set_item
            #     @item= Item.find(params[:id])
            # end
        
  
      end
    end
  end