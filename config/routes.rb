Rails.application.routes.draw do
    root to: 'pages#welcome'
    get '/welcome', to: 'pages#welcome', as: 'welcome'
    get '/login', to: 'users#login', as:"login"
    post '/login', to: 'users#check', as:"check"
    get '/register', to: 'users#register', as:"register"
    post '/logout', to: 'users#logout', as:"logout"
    post '/pictures/:id', to: 'pictures#change'
    resources :topics
    resources :messages
    resources :users
    resources :pictures
    resources :cvs
end
