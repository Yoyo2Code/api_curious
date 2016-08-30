class UsersController < ApplicationController

  def new
    # Faraday.get 'https://github.com/login/oauth/authorize?client_id=d9b967a5bc5975ade778&redirect_uri=http://localhost:3000/auth/github_oauth/callback&state=kryptonite'
  end
end
