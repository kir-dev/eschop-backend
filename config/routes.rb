Rails.application.routes.draw do
  resources :users
  resources :goods

  get 'authentication/callback'
  get '/login', to: 'authentication#login'

  root 'goods#index'
end
