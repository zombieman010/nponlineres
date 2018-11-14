Rails.application.routes.draw do

  get 'users/new'
  root 'static_pages#home'
  get '/projects', to: 'static_pages#projects'
  get '/resume',   to: 'static_pages#resume'
  get '/signup',   to: 'users#new'
  post '/signup',  to: 'users#create'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
