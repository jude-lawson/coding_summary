Rails.application.routes.draw do
  root to: 'home#index'
  get '/auth/github'
  get '/dashboard', to: 'dashboard#index'
  get '/auth/:provider/callback', to: 'sessions#create'
end
