LearnRails::Application.routes.draw do
  get "users/new"
  # the only is a restriction that only allows the New and Create routes
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  # see railstutorial table 7.1 for all of the different possible routes
  resources :users, only: [:new, :create, :show]
  root to: 'visitors#new'
end