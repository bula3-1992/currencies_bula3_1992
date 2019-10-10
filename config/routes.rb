Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homescreen#index', as: 'home'
  resources :homescreen, controller: :homescreen, only: :index
  resources :admin, controller: :admin, only: :index
end
