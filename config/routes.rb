Rails.application.routes.draw do
  
  root 'homes#welcome'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/maps', to: 'homes#maps'
  get 'solar', to: 'homes#solar'
  get 'nasa_images', to: 'nasa_api#nasa_images'
  get 'aliens/psychic_aliens'
  
  get '/search' => 'users#search', :as => 'search_page'
  resources :aliens
  resources :spaceships
  
  resources :users  
  
    
  
  
  get "/auth/google_oauth2/callback", to: "sessions#google_omniauth"
  
  resources :alien_planets
  resources :species
  resources :nasa_api
  resources :likes
  resources :posts
  resources :planets, only: [:index, :new, :create]
  resources :planets do
  resources :alien_planets, shallow: true
  
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
