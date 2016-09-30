Rails.application.routes.draw do

  get 'sessions/new'

  root 'home#index'
  get 'users/new'
  get 'resources/index' => 'resources#index'
  post 'users/create' => 'users#create'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
  get ':controller(/:action(/:id))'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
