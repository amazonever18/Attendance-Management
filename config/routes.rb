Rails.application.routes.draw do
  root 'time_cards#show'  

  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/timecard', to: 'time_cards#show'
  post '/timecard', to: 'time_cards#create'
  get '/monthly', to: 'time_cards#index'

  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
