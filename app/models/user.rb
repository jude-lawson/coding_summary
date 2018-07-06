class User < ApplicationRecord
  def self.create_from_auth_info(the_user, token)
    user_info = the_user['extra']['raw_info']
    find_or_create_by(uid: the_user['uid']) do |user|
      user.token              = token
      user.name               = user_info['name']
      user.username           = user_info['login']
      user.avatar_url         = user_info['avatar_url']
      # user.followers_url      = user_info.followers_url
      # user.following_url      = user_info.following_url
      # user.starred_url        = user_info.starred_url
      # user.subscriptions_url  = user_info.subscriptions_url
      # user.organizations_url  = user_info.organizations_url
      # user.repos_url          = user_info.repos_url
      # user.html_url           = user_info.html_url
      # user.events_url         = user_info.events_url
      user.followers          = user_info['followers']
      user.following          = user_info['following']
    end
  end

  def needs_to_be_updated?
    (DateTime.now.to_i - updated_at.to_i) > 43200 || username == nil
  end

  def update_from_refreshed_user_info(user_info)
    update(name: user_info['name'],
           username: user_info['login'],
           avatar_url: user_info['avatar_url'],
           followers_url: user_info['followers_url'],
           following_url: user_info['following_url'],
           starred_url: user_info['starred_url'],
           subscriptions_url: user_info['subscriptions_url'],
           organizations_url: user_info['organizations_url'],
           repos_url: user_info['repos_url'],
           html_url: user_info['html_url'],
           events_url: user_info['events_url'],
           updated_at: DateTime.now)
  end

  def starred_repos_count
    GitHubService.new(self).starred_repos.count
  end


end
