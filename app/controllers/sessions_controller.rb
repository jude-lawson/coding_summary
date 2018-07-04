class SessionsController < ApplicationController
  def create
    the_user = request.env['omniauth.auth']
    if user = User.create_from_auth_info(request.env['omniauth.auth'], the_user.credentials.token)
      session[:user_id] = user.id
    end
    redirect_to '/dashboard'
  end
end
