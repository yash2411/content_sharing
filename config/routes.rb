Rails.application.routes.draw do
  root 'static#index'
  get 'signup', to: "registrations#new"
  post 'signup', to: "registrations#create"
  get 'new_profile', to: "profiles#new"
  post 'profile', to: "profiles#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
