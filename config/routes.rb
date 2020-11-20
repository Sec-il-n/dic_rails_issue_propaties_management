Rails.application.routes.draw do
  root to: 'properties#new'
  resources :properties, only: [:new, :index, :create, :edit, :update]
  resources :stations, only: [:new, :index, :create, :edit, :update]
end
