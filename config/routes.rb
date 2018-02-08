Rails.application.routes.draw do
    jsonapi_resources :users, except: :create
    post 'users/register', to: 'users#create', as: :register
    post 'users/login', to: 'authenticates#login', as: :login
end
