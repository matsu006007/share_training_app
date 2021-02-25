Rails.application.routes.draw do
  devise_for :users

  root "top#index"
  
  resources :tweets, only: [:index, :new, :create]
end
