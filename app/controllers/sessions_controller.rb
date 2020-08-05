class SessionsController < ApplicationController

  def create
   user = User.find_by(name: params[:user][:name])
  #  user = user.try(:authenticate, params[:user][:password])
  #  return redirect_to(controller: 'users', action: 'new') unless user
  #  session[:user_id] = user.id
  #  @user = user
  return redirect_to '/login' unless user && user.authenticate(params[:user][:password])
  session[:user_id] = user.id
  @user = user
    # if user && user.authenticate(params[:user][:password])
    #   session[:user_id] = user.id
    #   @user = user
    # else
    #   redirect_to '/login'
    # end
  end

end


# def create
#   user = User.find_by(name: params[:user][:name])

#   user = user.try(:authenticate, params[:user][:password])

#   return redirect_to(controller: 'sessions', action: 'new') unless user

#   session[:user_id] = user.id

#   @user = user

#   redirect_to controller: 'welcome', action: 'home'
# end