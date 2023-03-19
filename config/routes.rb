Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "movies#index"
  resources :movies do
    resources :reviews
  end
end
