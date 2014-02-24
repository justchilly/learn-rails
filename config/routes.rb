LearnRails::Application.routes.draw do
  get "users/new"
  # the only is a restriction that only allows the New and Create routes
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  # see railstutorial table 7.1 for all of the different possible routes
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'visitors#new'

# user creating was working before adding the users#new code may not be necessary
  match '/signup', 	to: 'users#new',        via: 'get'
  match '/signin', 	to: 'sessions#new',     via: 'get'
  match '/signout', to: 'sessions#destroy',	via: 'delete'

end