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
            remder :new, status: :unprocessable_entity
        end
    end

    def destroy

    end

end