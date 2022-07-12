Rails.application.routes.draw do
  root 'static_pages#home'
  get 'sessions/new'
  get 'users/new'
  get '/projects', to: 'static_pages#projects'
  get '/resume',   to: 'static_pages#resume'
  get '/signup',   to: 'users#new'
  post '/signup',  to: 'users#create'
  get '/users', to: 'users#index'
  get '/edit', to: 'users#edit'
  patch '/edit', to: 'users#update'
  get '/profile', to: 'users#show'

  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/photography', to: 'photography#index'
  get '/photography/add_photo', to: 'photography#new'
  post '/photography/add_photo', to: 'photography#create'
  delete '/photography/delete_photo', to: 'photography#destroy'
  patch '/photography/update_photo', to: 'photography#update'

  get '/photography/wedding', to: 'photography#wedding'

  resources :photography
end
