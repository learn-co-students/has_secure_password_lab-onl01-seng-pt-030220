class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    #  return redirect_to(controller: 'users', action: 'new') unless user
    return redirect_to '/login' unless user
    session[:user_id] = user.id
    @user = user
  end

  def destroy
    session.delete :user_id

    redirect_to '/'
  end

end