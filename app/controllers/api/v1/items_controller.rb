module Api
    module V1
      class ItemsController < ApplicationController

       
        def index
            
            @items=Item.all
            render json: @items , status: :ok
        end

        def show
            @item = Item.find(params[:id])
            render json: @item, status: :ok
        end

       
        def create            

            
            @item = Item.new(item_params)
            if @item.save!
                render json: @item, status: :created
            else 
                render json: { errors: @item.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        def update
            @item = Item.find(params[:id])

            if @item.update(item_params)
            render json: {status: 'SUCCESS', message: 'item is updated', data:@restaurant}, status: :ok
            else
            render json: {status: 'Error', message: 'item  is not updated', data:@restaurant.errors}, status: :unprocessable_entity
            end
        end

   
        def destroy
            @item = Item.find(params[:id])
            @item.destroy
        end
        private

            def item_params
                params.permit(:item_name, :item_price, :item_category, :item_status, :item_description, :restaurant_id , foodimages: [])
            end

            # def set_item
            #     @item= Item.find(params[:id])
            # end
        
  
      end
    end
  end