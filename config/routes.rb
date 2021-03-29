Rails.application.routes.draw do
  root 'landing#home'
  devise_for :users

  resources :movies

  get 'my_account', to: 'user_dashboard#my_account'

  resources :bookings, only: %i[show destroy]
  get 'initiate_booking', to: 'bookings#initiate_booking'
  post 'process_booking', to: 'bookings#process_booking'

  match 'reports', to: 'reports#reports', via: %i[get post]
end
