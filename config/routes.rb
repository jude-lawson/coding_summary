Rails.application.routes.draw do
  root to: 'home#index'
  get '/auth/github'
  get '/auth/update_user', to: 'sessions#update'
  get '/dashboard', to: 'dashboard#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/followers', to: 'followers#index'
  get '/following', to: 'following#index'
  get '/starred_repos', to: 'starred_repos#index'
end
