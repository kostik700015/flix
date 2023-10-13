class ApplicationController < ActionController::Base

    private

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

    def require_signin
        unless current_user
            redirect_to new_session_url, alert: "Please sign in!"
        end 
    end

    helper_method :current_user

end
