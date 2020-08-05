class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def welcome
    end

    def new 
        @user = User.new 
    end

    def create
        @user = User.create(user_params)
        return redirect_to action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to action: 'welcome'
    end

    private 

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 
end
