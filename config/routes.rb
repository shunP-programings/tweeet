Rails.application.routes.draw do
  root 'tweets#index'
  get 'top/login'
  post 'top/login'
  get 'top/logout'
  resources :users, only: [:index, :new, :create, :destroy]
  resources :tweets, only: [:index, :new, :create, :destroy]
  resources :likes, only: [:create, :destroy]
end
