class SessionsController < ApplicationController

    def new

    end

    def create
        # byebug
        @user = User.find_by(name: params[:user][:name])
        
        if @user 

            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to root_path
            else
                flash[:alert] = "Incorrect Password"
                redirect_to login_path
            end

        else
            flash[:alert] = "Could not find user"
            redirect_to login_path
        end

    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end