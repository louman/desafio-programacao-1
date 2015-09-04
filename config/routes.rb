Rails.application.routes.draw do
  
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'uploads#index'

  resources :uploads
  
end