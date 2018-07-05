class DashboardController < ApplicationController
  def index
    if !current_user
      redirect_to '/auth/github'
    else
      user = User.find(session[:user_id])
      if user.needs_to_be_updated?
        redirect_to '/auth/update_user'
      else
        render json: user
      end
    end
  end
end
