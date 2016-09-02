class GithubUser
  attr_reader :current_user, :github_service

  def initialize(current_user)
    @github_service = GithubService.new
    @current_user = current_user
  end

  def organizations
    result = github_service.organizations(current_user)
    result.each do |organization|
      Organization.new()
    end
  end

  def repositories
    result = github_service.repositories(current_user)
    result.map do |repo|
      Repository.new()
    end
  end

  def followed_events
    result = github_service.followed_events(current_user)

    result.each do |event|
      Event.new(event)
    end

    # followed_events = []
    # followed_events << result[0][:actor][:display_login] + "-" + result[0][:type]
    # followed_events << result[1][:actor][:display_login] + "-" + result[0][:type]
    # followed_events << result[2][:actor][:display_login] + "-" + result[0][:type]
    # followed_events
  end

  def recent_user_history
    result = github_service.recent_user_history(current_user)
    extract_commits(result)
  end

  def extract_commits(result)
    result.map do |event|
      event[:payload][:commits] if event[:payload].keys.include?(:commits)
    end.compact.map do |commit|
      commit.map do |cmt|
        cmt[:sha]
      end
      commit.first[:url]
    end
  end
end
