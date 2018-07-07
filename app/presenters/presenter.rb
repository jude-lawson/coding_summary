class Presenter
  def initialize(current_user)
    @service = GitHubService.new(current_user)
  end

  def followers
    @service.get_followers
      .map { |follower_attributes| Follower.new(follower_attributes) }
  end

  def fave_users
    @service.get_fave_users
      .map { |fave_user_attributes| FaveUser.new(fave_user_attributes) }
  end

  def starred_repos
    @service.get_starred_repos
      .map { |starred_repo_attributes| StarredRepo.new(starred_repo_attributes) }
  end
end
