Rails.application.routes.draw do
  root 'users#new'
  get 'search/search'
  get 'search/index'
  get :login, 'user_sessions/new'
  get :logout, 'user_sessions/destroy'

  resources :user_sessions, only: %i[create]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end