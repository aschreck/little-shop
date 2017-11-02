Rails.application.routes.draw do
  root "welcome#index"

  namespace :admin do
    get '/dashboard', to: "base#dashboard"

  end

  resources :items, only: [:index]
  resource :cart, only: [:show, :create, :destroy, :update]
  resources :users, only: [:new, :create]
  resources :orders, only: [:index, :show, :create]

  get '/dashboard', to: "base#dashboard"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/:title', to: 'categories#show'
end
