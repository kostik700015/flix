Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "movies#index"
  resources :movies do
    resources :reviews
  end

  resources :users
  get "signup" => "users#new"

  resources :session, only: [:new, :create, :destroy]

end
