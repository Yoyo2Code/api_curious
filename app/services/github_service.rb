class GithubService
  # attr_reader :connection

  def initialize
    @connection ||= Faraday.new("https://github.com/login/oauth/")
  end

  def authorize_users
    response = @connection.get do |req|
      req.url 'authorize'
      req.params['client_id'] = "d9b967a5bc5975ade778"
      req.params['redirect_uri'] = '/auth/oauth/callback'
      # req.params['state'] = "api"
    end
    byebug
  end
end
