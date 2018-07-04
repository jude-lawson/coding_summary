class DashboardController < ApplicationController
  def index
    user = User.find(session[:user_id])
    if !user
      redirect_to '/auth/github'
    elsif user.needs_to_be_updated?
      redirect_to '/auth/update_user'
    else
      render json: user
    end
  end
end
