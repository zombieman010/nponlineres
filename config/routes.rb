Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
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

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
