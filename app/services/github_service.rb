class GitHubService
  def initialize(current_user)
    @conn = Faraday.new(url: 'https://api.github.com')
    @token = current_user.token
    @username = current_user.username
  end

  def user_info
    response = @conn.get("/users/#{@username}", { access_token: @token }).body
    JSON.parse(response)
  end

  def get_starred_repos
    response = @conn.get("/users/#{@username}/starred", { access_token: @token }).body
    JSON.parse(response)
  end

  def get_followers
    response = @conn.get("/users/#{@username}/followers", { access_token: @token }).body
    JSON.parse(response)
  end

  def get_fave_users
    response = @conn.get("/users/#{@username}/following", { access_token: @token }).body
    JSON.parse(response)
  end
end
