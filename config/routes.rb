Rails.application.routes.draw do
    root to: 'toppages#index'
    
    get 'login', to: 'session#new'
    post 'login', to: 'session#create'
    get 'logout', to: 'session#destroy'
    
    get 'signup', to: 'users#new'
    resources :users, only: [:show, :new, :create]
    
    resources :items, only: [:new]
end
 