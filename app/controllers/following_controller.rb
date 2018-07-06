class FollowingController < ApplicationController
  def index
    @favorite_users = GitHubService.new(current_user).get_favorite_users
  end
end
