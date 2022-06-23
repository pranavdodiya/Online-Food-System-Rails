class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    # def add_role
    #     @user = User.find(params[:id])
    #     @user.add_role :params[:add_role]
    #     if @user.update(user_params)
    #       render json: @user
        
    #     end
    # end

    private


        def respond_with(resource, _opts = {})
            register_success && return if resource.persisted?

            register_failed

        end


        def register_success
            UserMailer.with(user: @user).welcome_email.deliver_later
            # user=User.find_by(email: @user.email)
            # if user.role == "Custmore"
            #     p user.id
            #     x=Cart.new(user_id: user.id)
            #     p x.save(:validate => false)
            # end
            render json: {
                message: 'Signed up sucessfully.'
                #user: current_user
                
            }, status: :ok
        end

        def register_failed 
            render json: { message: 'Something went wrong.'}, status: :unprocessable_entity
        end

    def register_failed 
        render json: { message: 'Something went wrong.'}, status: :unprocessable_entity
    end
    
    def user_params
        params.permit(:email, :name, :contact_number, :password, :role)
    end
end