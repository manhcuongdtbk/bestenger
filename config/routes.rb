Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :channels, only: %i[show] do
    resources :channels_users, only: %i[create]
    resources :messages, only: %i[create]
  end
end
