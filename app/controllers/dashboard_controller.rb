class DashboardController < ApplicationController
  def index
    user = User.first
    if !user
      redirect_to '/auth/github'
    elsif user.needs_to_be_updated?
      # user.update_with_new_info
      # ^ This should be an update action in the Sessions Controller
    else
      render json: user
    end
  end
end
