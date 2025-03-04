Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/dashboard', to: 'pages#dashboard', as: 'user_dashboard'
  patch '/dashboard', to: 'bookings#update', as: 'update_booking'
  resources :spaces, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
end
