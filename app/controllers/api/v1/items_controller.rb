module Api
    module V1
      class ItemsController < ApplicationController

        before_action :set_item, except:[:index,:create] 

        #GET /users
        def index
            @items=Item.all
            render json: @items , status: :ok
        end

        #GET /users/{username}
        def show
            render json: @item, status: :ok
        end

        #POST /users
        def create
            @item = Item.new(item_params)
            if @item.save!
                render json: @item, status: :created
            else 
                render json: { errors: @item.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        #PUT /users/{username}
        def update
            unless @item.update(item_params)
                render json: { errors: @item.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        #DELETE /users/{username}
        def destroy
            @item.destroy
        end
        private

            def item_params
                params.permit(:item_name, :item_price, :item_category, :item_status, :item_description, :restaurant_id , foodimages: [])
            end

            def set_item
                @item= Item.find(params[:id])
            end
        
  
      end
    end
  end