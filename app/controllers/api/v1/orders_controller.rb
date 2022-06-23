module Api
    module V1
      class OrdersController < ApplicationController

       
        def index
            #current_user.id



                    if params[:user_id]
                        @user=User.find(params[:user_id])
                        if @user.role== "Customer"
                            @orders=Order.where(user_id: params[:user_id])
                        elsif @user.role== "Restaurant Owner"
                            @e=Restaurant.find_by(user_id: params[:user_id])
                             @orders=Order.where(restaurant_id: @e.id)
                        elsif @user.role== "Delivery Men"
                            x= Delivery.select(:id).where(user_id: params[:user_id])
                            @orders=Order.where(delivery_id: x)
                        end
                    end
                    render json: @orders , status: :ok




                #if User.find(params[:user_id]).role == "Restaurant Owner"
                    # if params[:item_id]
                    #     @e=Restaurant.where(user_id: params[:user_id])
                    #     @orders=Order.where(item_id:=>@e.id)
                                    # @a=Item.find(params[:item_id]).restaurant
                                    # @b=Restaurant.find(@a.id).item_ids
                                    # @orders=Order.where(:item_id=>@b)
                            
                              #if  User.find(params[:user_id]).role == "Custmore"
                    # if params[:user_id]
                    # #     if User.find(params[:user_id]).role == "Custmore"
                    # #         @orders=Order.where(user_id: params[:user_id])
                    #     if User.find(params[:user_id]).role == "Delivery Man"
                    #         @a=Delivery.where(user_id: params[:user_id])
                    #         @orders=Order.where(delivery_id: @a.id)

                    #     else User.find(params[:user_id]).role == "Restaurant Owner"
                    #         @e=Restaurant.where(user_id: params[:user_id])
                    #         @orders=Order.where(item_id: @e.id)
                    
                    #     #  else
                    #     # @orders=Order.all
                    # end
                # end
#x= Delivery.select(:id).where(user_id: params[:user_id])
                    # elsif params[:user_id]
                    #     @orders=Order.where(user_id: params[:user_id])
                    
                    
                    # elsif params[:delivery_id]
                    #     @orders=Order.where(delivery_id: params[:delivery_id])
                    # else
                        #@orders=Order.all
                
                    

            
        end

        def show
            @order = Order.find(params[:id])
            render json: @order, status: :ok
        end

       
        def create
            
            @order = Order.new(order_params)
            # @order.restaurant_id = Item.find(params[:restaurant_id]).restaurant.id
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
                params.require(:order).permit(:address, :restaurant_id, :item_quantity, :status, :delivery_id, :user_id,:total_price, order_obj: {})
            end

            # def set_item
            #     @item= Item.find(params[:id])
            # end
        
  
      end
    end
  end