class SessionsController < ApplicationController
  before_action :setup_connection, only: [:update]
   
  def create
    the_user = request.env['omniauth.auth']
    if user = User.create_from_auth_info(request.env['omniauth.auth'], the_user.credentials.token)
      session[:user_id] = user.id
    end

    redirect_to '/dashboard'
  end

  def update
    user_info = JSON.parse(@github_conn.get("/users/#{current_user.username}").body)
    user = User.find(session[:user_id])
    user.update_from_refreshed_user_info(user_info)

    redirect_to '/dashboard'
  end

  private

  def setup_connection
    @github_conn = Faraday.new(url: 'https://api.github.com')
  end
end
