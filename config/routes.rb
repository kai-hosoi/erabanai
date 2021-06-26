Rails.application.routes.draw do
  get 'users/new'
  get 'search/index'
  root 'search#search'
  get 'search/select_store'
  get 'users/mypage'
  get :login, 'user_sessions/new'
  get :logout, 'user_sessions/destroy'

  resources :user_sessions, only: %i[create]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
