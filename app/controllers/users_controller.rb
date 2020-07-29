class UsersController < ApplicationController
    
    def new

    end

    def create
    
        if params[:user][:password] == params[:user][:password_confirmation]
            User.create(user_params)
            session[:user_id] = User.last.id
            redirect_to root_path
        else
            redirect_to new_user_path
        end
    
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end