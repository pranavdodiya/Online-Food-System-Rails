class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json


    

    private


        def respond_with(resource, _opts = {})
            register_success && return if resource.persisted?

            register_failed

        end


        def register_success
            # p current_user["1"]["user"].id
            # @cart=Cart.create!(user_id: )
            render json: {
                message: 'Signed up sucessfully.',
                user: current_user
                
            }, status: :ok
        end

        def register_failed 
            render json: { message: 'Something went wrong.'}, status: :unprocessable_entity
        end


    
    def user_params
        params.permit(:email, :name, :contact_number, :password, :username)
    end
end