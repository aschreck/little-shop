Rails.application.routes.draw do
  root "welcome#index"

  resources :items, only: [:index]
  resource :cart, only: [:show, :create, :destroy, :update]
  resources :users, only: [:new, :create]

  get '/dashboard', to: "base#dashboard"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "/:title", to: "category#show"
end
