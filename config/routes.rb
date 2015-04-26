Rails.application.routes.draw do
    resource :user

    namespace :admin do
      resources :rewards, :users
    end

    namespace :user do
      resources :rewards, only: [:new, :create]
    end

    get '/admin', to: "admin#show"

    get '/admin/login', to: "sessions#new"

    get '/login', to: "sessions#new"

    post '/login', to: "sessions#create"

    delete '/logout', to: "sessions#destroy"
end
