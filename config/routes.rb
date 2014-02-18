LearnRails::Application.routes.draw do
  get "users/new"
  # the only is a restriction that only allows the New and Create routes
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  resources :users, only: [:new, :create]
  root to: 'visitors#new'
end