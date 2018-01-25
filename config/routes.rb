Rails.application.routes.draw do
  resources :neighborhoods, only: [:index, :show]
  resources :liquor_stores, only: [:index, :show]
  resources :analytics, only: [:index]
  resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :reviews, only: [:create, :update, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :relationships, only: [:create, :destroy]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  post "sessions", to: "sessions#create", as: "sessions"
  delete "sessions", to: "sessions#destroy"
  get "reviews/new", to: "reviews#new"
  get "reviews/edit", to: "reviews#edit"
end
