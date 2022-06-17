class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
        @user = User.new(user_params)
        if @item.save!
            render json: @user, status: :created
        else 
            render json: { errors: @user.errors.full_messages },
                status: :unprocessable_entity
        end
    end

    private
    def respond_with(resource, _opts = {})
        register_success && return if resource.persisted?

        register_failed

    end

    def register_success
        render json: {
            message: 'Signed up sucessfully.',
            user: current_user
            
        }, status: :ok
    end

    def register_failed 
        render json: { message: 'Something went wrong.'}, status: :unprocessable_entity
    end
    
    def user_params
        params.permit(:email, :name, :contact_number, :password)
    end
end