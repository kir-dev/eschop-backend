Rails.application.routes.draw do
  resources :goods

  root "goods#index"
end
