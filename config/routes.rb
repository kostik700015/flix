Rails.application.routes.draw do
  resources :favorites

  # Defines the root path route ("/")
  root "movies#index"
  resources :movies do
    resources :reviews
  end

  resources :users
  get "signup" => "users#new"
  get "signin" => "sessions#new"

  resource :session, only: [:new, :create, :destroy]

end
