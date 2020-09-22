Rails.application.routes.draw do
  root to: "reservations#index"
  resources :users 
end
