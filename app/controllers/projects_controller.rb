class ProjectsController < ApplicationController

  def new
    if current_user
      @github_data = GithubUser.new(current_user)
    end
    # current_user
    # username
    # profile_pic
    # number of stared repos
    # number of followers
    # number of following

    # list of organization
    # .organizations
    # list of repositories
    # .repositories

    # summary of recent activity feed from users I follow
    # .followed_events
    # View a summary feed of my recent activity (recent commits)
    # .recent_user_history
  end
end
