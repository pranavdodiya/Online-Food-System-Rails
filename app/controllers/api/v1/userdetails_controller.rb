module Api
    module V1
      class UserdetailsController < ApplicationController

        def index
            @userdetails=Userdetail.all
            render json: @userdetails , status: :ok
        end

       
        def show
            render json: @userdetail, status: :ok
        end

        
        def create
            @userdetail = Userdetail.new(user_params)
            if @userdetail.save!
                render json: @userdetail, status: :created
            else 
                render json: { errors: @userdetail.errors.full_messages },
                    status: :unprocessable_entity
            end
        end

       
        def update
            unless @user.update(userdetail_params)
                render json: { errors: @userdetail.errors.full_messages },
                    status: :unprocessable_entity
            end
        end


        def destroy
            @userdetail.destroy
        end

        private

            def userdetail_params
                params.permit(:username, :user_address, :user_contact_number, :user_city)
            end

            def set_userdetail
                @userdetail = Userdetail.find(params[:id])
            end
        
  
      end
    end
  end