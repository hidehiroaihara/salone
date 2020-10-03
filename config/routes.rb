Rails.application.routes.draw do
  root to: "reservations#index"
  resources :reservations
  resources :stylists
  resources :users do
    collection do
      get 'search'
    end
  end
end
