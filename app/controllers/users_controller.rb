class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to @user, notice: "Thanks for signing up"
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        set_user
    end

    def update
        set_user
        if @user.update(user_params)
            redirect_to @user, motice: "Account Updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        set_user
        @user.destroy
        redirect_to movies_url, status: :see_other,
            alert: "Account was deleted!"
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).
          permit(:name, :email, :password, :password_confirmation)           
    end
end
