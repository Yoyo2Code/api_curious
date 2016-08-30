class SessionsController < ApplicationController

  def new
    response = github.authorize_users
  end

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to root_path
  end
end
