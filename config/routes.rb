# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'movies#index'
  resources :movies do
    resources :reviews
  end

  resources :users
  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'

  resource :session, only: %i[new create destroy]
end
