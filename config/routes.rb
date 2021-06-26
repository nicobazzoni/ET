Rails.application.routes.draw do
  
  root 'homes#welcome'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get 'nasa_images', to: 'nasa_api#nasa_images'
  resources :aliens
  resources :spaceships
  resources :users
  resources :alien_planets
  resources :species
  resources :nasa_api
  resources :planets, only: [:index, :new, :create]
  resources :planets do
  resources :alien_planets, shallow: true
  
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
