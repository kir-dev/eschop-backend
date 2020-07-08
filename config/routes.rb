Rails.application.routes.draw do
  resources :users
  resources :goods

  get '/callback', to: 'application#callback'

  root 'goods#index'
end
