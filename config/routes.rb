Rails.application.routes.draw do
  devise_for :users
  root to: "walkers#index"
  resources :users, only: :show
  patch 'users/:id', to: 'users#update'
  get "/my-bookings", to: 'bookings#my_bookings'
  # Resources is creating the 7 routes we need for walkers
  # TODO: Leave it as it is but check if we need to nest resources
  get "my_walkers", to: "walkers#my_walkers"
  resources :walkers do
    # Add other routes
    resources :bookings, only: %i[new create]
  end
end
