Rails.application.routes.draw do

  root 'static_pages#home'
  get '/projects', to: 'static_pages#projects'
  get '/resume',   to: 'static_pages#resume'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
