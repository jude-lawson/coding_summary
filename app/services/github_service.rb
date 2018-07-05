class GithubService
  def initialize
    @conn = Faraday.new(url: 'https://api.github.com')
    @token = current_user.token
    @username = current_user.username
  end

  def user_info
    response = @conn.get("/users/#{@username}", { access_token: @token }).body
    JSON.parse(response)
  end
end
