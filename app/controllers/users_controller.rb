class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if params[:user][:password] != params[:user][:password_confirmation]
      redirect_to '/signup'
    else
      @user = User.create(user_params)
      session[:user_id] = @user.id
      render 'users/welcome'
    end
  end

  def welcome
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end 