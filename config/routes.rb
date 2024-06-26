require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  
  mount Sidekiq::Web => '/sidekiq'

  root 'contents#index'

  get 'signup', to: "registrations#new"
  post 'signup', to: "registrations#create"
  get '/users/check_email_uniqueness', to: 'registrations#check_email_uniqueness'
  get '/verify_email', to: "registrations#verify_email"
  get '/verify_account', to: "registrations#verify_account"


  get 'new_profile', to: "profiles#new"
  post 'profile', to: "profiles#create"

  get 'login', to: "logins#new"
  post 'login', to: "logins#create"
  delete 'logout', to: 'logins#destroy'

  resources :articles
  resources :audios
  resources :videos
  resources :images
  resources :documents
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
