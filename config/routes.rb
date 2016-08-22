Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end

  devise_for :users

  resources :items

  namespace :api do
    resources :items
  end

  root to: 'items#index'
end
