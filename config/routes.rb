Rails.application.routes.draw do
 
  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signin' =>  'sessions#new'
  post '/signin' =>  'sessions#create'

  get '/logout' => 'sessions#destroy'
  post '/rides/create' => 'rides#create'
    
  resources :users
  resources :attractions
  resources :rides
end