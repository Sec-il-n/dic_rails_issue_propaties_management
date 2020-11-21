Rails.application.routes.draw do
  root to: 'properties#new'
  resources :properties
  resources :stations, only: [:new, :create, :edit, :update]
  # resources :stations, only: [:new, :index, :create, :edit, :update]
end
