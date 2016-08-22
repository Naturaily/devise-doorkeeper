Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users

  resources :items

  root to: 'items#index'
end
