Rails.application.routes.draw do
  resources :users

  # Defines the root path route ("/")
  root "movies#index"
  resources :movies do
    resources :reviews
  end
end
