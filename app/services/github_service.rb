class GithubService
  attr_reader :api_connection,
              :current_user

  def initialize(current_user)
    @current_user = current_user
    @api_connection ||= Faraday.new("https://api.github.com/") do |faraday|
                          faraday.params["auth_token"] = current_user.token
                        end
  end

  def recent_user_history
    response = api_connection.get("users/#{current_user.username}/events")
    parse( response )
  end

  def followed_events
    response = api_connection.get("users/#{current_user.username}/received_events")
    parse( response )
  end

  def organizations
    response = api_connection.get("/users/#{current_user.username}/orgs")
    parse( response )
  end

  def repositories
    response = api_connection.get("user/repos")
    parse( response )
  end

  def parse(response)
    JSON.parse( response.body, symbolize_names: true )
  end
end
