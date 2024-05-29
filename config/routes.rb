Rails.application.routes.draw do
  devise_for :users
  root to: "walkers#index"
  resources :users, only: :show
  patch 'users/:id', to: 'users#update'
  # Resources is creating the 7 routes we need for walkers
  # TODO: Leave it as it is but check if we need to nest resources
  resources :walkers do
    # Add other routes
    resources :bookings, only: %i[new create]
  end
end
