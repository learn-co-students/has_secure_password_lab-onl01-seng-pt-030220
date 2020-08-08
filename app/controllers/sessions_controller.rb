class SessionsController < ApplicationController

    def new
    end
  
    def create
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        render 'users/welcome'
      else
        return head(:forbidden)
      end
    end
  
    def destroy
      session.delete(:user_id)
      redirect_to login_path
    end
    
end
