class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :github

  def github
    @github ||= GithubService.new
  end
end
