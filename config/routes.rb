Rails.application.routes.draw do
  devise_for :users

  root "top#index"
  
  resources :tweets, only: [:index, :new, :create, :show]
  resources :users, only: [:show]
end
