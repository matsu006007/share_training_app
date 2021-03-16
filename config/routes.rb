Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'

  root "top#index"
  
  resources :tweets do
    resources :messages, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  
end
