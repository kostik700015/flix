class ApplicationController < ActionController::Base

    private

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end

    def current_user?(user)
        current_user == user
    end

    helper_method :current_user?

    def require_signin
        unless current_user
            session[:inteded_url] = request.url
            redirect_to new_session_url, alert: "Please sign in!"
        end 
    end

    helper_method :current_user

end
