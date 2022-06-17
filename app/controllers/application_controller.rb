class ApplicationController < ActionController::API
    before_action :abc, if: :devise_controller?

    protected
    def abc
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :contact_number)}
    end

    
end
