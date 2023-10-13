class SessionsController < ApplicationController

    def new
        
    end

    def create
       user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to (session[:intended_url] || user), notice: "Welcome back, dear #{user.name}!"
            session[:intended_url] = nil
        else
            flash.now[:alert] = "Combination email/password invalid"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to movies_url, status: :see_other,
            notice: "You are signed out now!"
    end

end