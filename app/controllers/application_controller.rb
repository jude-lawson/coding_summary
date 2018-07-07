class ApplicationController < ActionController::Base
  helper_method :current_user

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def create_presenter
    @presenter = Presenter.new(current_user)
  end
end
