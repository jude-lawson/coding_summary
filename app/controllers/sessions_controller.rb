require './app/services/github_service'

class SessionsController < ApplicationController
  # before_action :setup_connection, only: [:update]
   
  def create
    the_user = request.env['omniauth.auth']
    if (user = User.create_from_auth_info(the_user, the_user.credentials.token))
      session[:user_id] = user.id
    end

    redirect_to '/dashboard'
  end

  def update
    user = User.find(session[:user_id])
    user.update_from_refreshed_user_info(GitHubService.new(current_user).user_info)

    redirect_to '/dashboard'
  end
end
