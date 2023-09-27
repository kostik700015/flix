Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "movies#index"
  resources :movies do
    resources :reviews
  end

  resources :users
  get "signup" => "users#new"
end
