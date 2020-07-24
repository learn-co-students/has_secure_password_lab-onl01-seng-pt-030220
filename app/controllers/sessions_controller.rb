class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user=User.find_by(name: params[:user][:name])
   # byebug
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
                                         
    session[:user_id] = @user.id
  end

  def show
  end
end
