class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,  :email, :password, :contact_number)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit((:name,  :email, :password, :contact_number)}
    end
end
