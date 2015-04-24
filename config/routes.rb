Rails.application.routes.draw do
    resource :user

    resources :rewards, only: [:show]

    namespace :admin do
      resources :rewards, :users, :admin, only: [:show]
    end

    get '/admin', to: "admin#show"

    get '/admin/login', to: "sessions#new"

    get '/login', to: "sessions#new"

    post '/login', to: "sessions#create"

    delete '/logout', to: "sessions#destroy"
end
