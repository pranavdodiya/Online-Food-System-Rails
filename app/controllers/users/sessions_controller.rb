class Users::SessionsController < Devise::SessionsController
    respond_to :json

    def res_owner_show
        
        if current_user.role = "Restaurant Owner"
            @res = Restaurant.find(current_user.id)
            render json: @res, status: :ok
        else
            render json: {
                message: "Not registered"
            }, status: :ok
        end
    end

    # def admin
    #     if current_user.id == 1
    #         @res = Restaurant.all
    #         render json: @res, status: :ok
        
    #     end
    # end
    
    private 

    def respond_with(_resource, _opts = {})
        render json: {
            message: 'You are logged in.',
            user: current_user
        }, status: :ok
    end

    def respond_to_on_destroy
        log_out_success && return if current_user

        log_out_failure
    end

    def log_out_success
        render json: { message: 'You are logged out. '}, status: :ok
    end

    def log_out_failure
        render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
    end
end
