Rails.application.routes.draw do
  resources :reviews
  resources :neighborhoods, only: [:index, :show]
  resources :liquor_stores, only: [:index, :show]
  resources :users
  resources :user do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :relationships, only: [:create, :destroy]
end
