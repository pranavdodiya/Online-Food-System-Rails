module Api
    module V1
      class DeliveriesController < ApplicationController

       
        def index
            @deliveries=Delivery.where(user_id: params[:user_id])
            #@deliveries=Delivery.all
            render json: @deliveries , status: :ok
            
        end

        def show
            @delivery=Delivery.where(user_id: params[:user_id])
            #@delivery = Delivery.find(params[:id])
            render json: @delivery, status: :ok
        end

       
        def create            

            
            @delivery = Delivery.new(delivery_params)
            if @delivery.save!
                render json: @delivery, status: :created
            else 
                render json: { errors: @delivery.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

        def update
            @delivery = Delivery.find(params[:id])

            if @delivery.update(delivery_params)
            render json: {status: 'SUCCESS', message: 'item is updated', data:@delivery}, status: :ok
            else
            render json: {status: 'Error', message: 'item  is not updated', data:@delivery.errors}, status: :unprocessable_entity
            end
        end

   
        def destroy
            @delivery = Delivery.find(params[:id])
            @delivery.destroy
        end
        private

            def delivery_params
                params.require(:deliveryman_data).permit(:user_id,:deliveryman_name,:deliveryman_number,:delivery_status,:deliveryman_city)
            end

          
  
      end
    end
end

