Rails.application.routes.draw do
    root 'application#dashboard'

    resource :user

    namespace :admin do
      resources :rewards, :users
    end

    namespace :user do
      resources :rewards, only: [:new, :create]
    end

# for authentication through twitter
    # get '/auth/:provider/callback' => 'sessions#create'
    # match via: [:get, :post], "/login" => redirect("/auth/twitter"), as: :login

    get '/admin', to: "admin#show"

    get '/admin/login', to: "sessions#new"

    get '/login', to: "sessions#new"

    post '/login', to: "sessions#create"

    delete '/logout', to: "sessions#destroy"
end
