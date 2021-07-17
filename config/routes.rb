Rails.application.routes.draw do
  root 'search#index'
  get 'users/new'
  get 'search/index'
  get 'search/search'
  get 'search/select_store'
  get 'users/mypage'
  get :login, 'user_sessions/new'
  get :logout, 'user_sessions/destroy'
  get '/firstpage', to:'react#firstpage'

  resources :user_sessions, only: %i[create]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
