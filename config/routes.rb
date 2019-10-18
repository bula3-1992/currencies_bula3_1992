require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  mount V1::Root => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homescreen#index', as: 'home'
  resources :homescreen, controller: :homescreen, only: :index
  resources :admin, controller: :admin, only: :index do
    post '/' => 'admin#update', on: :collection, as: 'update'
  end

end
