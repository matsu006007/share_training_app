Rails.application.routes.draw do
  devise_for :users

  root "top#index"
  
  resources :tweets, only: [:index, :new, :create]
  resources :users, only: [:show]
end
