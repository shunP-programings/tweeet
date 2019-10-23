Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :destroy]
  root 'users#index'
end
