require 'github_service'
class FollowersController < ApplicationController
  before_action :create_presenter, only: [:index]

  def index
  end

  private

  # def create_presenter
  #   @presenter = Presenter.new(current_user)
  # end
end
