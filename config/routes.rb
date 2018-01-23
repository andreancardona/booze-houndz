Rails.application.routes.draw do
  resources :users
  resources :relationships
  resources :neighborhoods, only: [:index, :show]
  resources :liquor_stores, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
