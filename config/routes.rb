Rails.application.routes.draw do
  devise_for :users
  root to: "spaces#index"
  get '/dashboard', to: 'pages#dashboard', as: 'user_dashboard'

  resources :spaces, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create, :update, :show]
  end

  resources :bookings, only: [:update, :destroy, :index]
end
