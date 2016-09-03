class GithubService
  attr_reader :api_connection,
              :current_user

  def initialize(current_user)
    @current_user = current_user
    @api_connection ||= Faraday.new("https://api.github.com/")
  end

  def recent_user_history
    response = api_connection.get("users/#{current_user.username}/events") do |faraday|
      faraday.params["Authorization"] = "token #{current_user.auth_token}"
    end
    parse( response )
  end

  def followed_events
    response = api_connection.get("users/#{current_user.username}/received_events") do |faraday|
      faraday.params["Authorization"] = "token #{current_user.auth_token}"
    end
    parse( response )
  end

  def organizations
    response = api_connection.get("/users/#{current_user.username}/orgs") do |faraday|
      faraday.params["Authorization"] = "token #{current_user.auth_token}"
    end
    parse( response )
  end

  def repositories
    response = api_connection.get("user/repos") do |faraday|
      faraday.params["Authorization"] = "token #{current_user.auth_token}"
    end
    parse( response )
  end

  def parse(response)
    JSON.parse( response.body, symbolize_names: true )
  end
end
