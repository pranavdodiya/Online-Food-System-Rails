module Api
    module V1
      class OrdersController < ApplicationController

       
        def index
            #current_user.id
                #if User.find(params[:user_id]).role == "Restaurant Owner"
                    if params[:item_id]
                        @a=Item.find(params[:item_id]).restaurant
                        @b=Restaurant.find(@a.id).item_ids
                        @orders=Order.where(:item_id=>@b)
                 
                    #if  User.find(params[:user_id]).role == "Custmore"
                    elsif params[:user_id]
                        if User.find(params[:user_id]).role == "Custmore"
                            @orders=Order.where(user_id: params[:user_id])
                        else User.find(params[:user_id]).role == "Delivery Man"
                            @a=Delivery.find_by(user_id: params[:user_id])
                            @orders=Order.where(delivery_id: @a.id)
                        end
                    else
                        @orders=Order.all
                    end


                    # elsif params[:user_id]
                    #     @orders=Order.where(user_id: params[:user_id])
                    
                    
                    # elsif params[:delivery_id]
                    #     @orders=Order.where(delivery_id: params[:delivery_id])
                    # else
                        #@orders=Order.all
                
                    

            render json: @orders , status: :ok
        end

        def show
            @order = Order.find(params[:id])
            render json: @order, status: :ok
        end

       
        def create
            @order = Order.new(order_params)
            @order.item_id=Item.find(params[:item_id]).restaurant.id
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
                params.permit(:address, :item_id, :item_quantity, :status, :delivery_id,:user_id)
            end

            # def set_item
            #     @item= Item.find(params[:id])
            # end
        
  
      end
    end
  end