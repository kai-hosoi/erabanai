Rails.application.routes.draw do
  get 'search/search'
  get :login, 'user_sessions/new'
  get :logout, 'user_sessions/destroy'

  resources :user_sessions, only: %i[create]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
