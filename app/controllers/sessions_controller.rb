class SessionsController < ApplicationController

    def create 
    @user = User.find(params[:name])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id 
    end

    def destroy 
    
    end 

end
