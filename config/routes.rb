Rails.application.routes.draw do
  
  root 'homes#welcome'
  resources :aliens
  resources :spaceships
   
  resources :alien_planets
  resources :planets, only: [:index, :new, :create]
  resources :species
  resources :planets do
  resources :alien_planets, shallow: true
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
