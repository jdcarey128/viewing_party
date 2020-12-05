Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resource :registration, only: [:new], controller: 'users'
  resource :dashboard, only: [:show], controller: 'users'

  root 'welcome#index'

  post '/', to: 'sessions#create'

  get '/dashboard', to: 'users#show'

  resources :movies, only: [:index]
  get '/discover', to: 'movies#discover', as: :discover
  get '/movies/search', to: 'movies#search', as: :movie_search

  resources :movies, only: [:show]

  post '/viewing-party/new', to: 'viewing_party#create'

  resources :friendships, only: [:create]
end
