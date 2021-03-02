Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users

  root "top#index"
  
  resources :tweets, only: [:index, :new, :create, :show] do
    resources :messages, only: [:create]
  end
  resources :users, only: [:show]
  
end
