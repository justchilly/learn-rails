LearnRails::Application.routes.draw do
  # the only is a restriction that only allows the New and Create routes
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  root to: 'visitors#new'
end