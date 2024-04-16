Rails.application.routes.draw do
  root 'static#index'
  get 'signup', to: "registrations#new"
  post 'signup', to: "registrations#create"

  get 'new_profile', to: "profiles#new"
  post 'profile', to: "profiles#create"

  get 'login', to: "logins#new"
  post 'login', to: "logins#create"
  delete 'logout', to: 'logins#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
