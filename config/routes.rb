Rails.application.routes.draw do
  resources :users
  resources :relationships
  resources :neighborhoods
  resources :liquor_stores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
