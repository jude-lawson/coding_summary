require 'github_service'
class FollowersController < ApplicationController
  def index
    @followers = GitHubService.new(current_user).get_followers
  end
end
