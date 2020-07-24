class UsersController < ApplicationController
  def new
  end

  def create
    User.create(user_params)
  end

  private

  def user_params
    params_require(:user).permit(:username,:password,:password_confirmation)
  end
end
