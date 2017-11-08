Rails.application.routes.draw do
  root "welcome#index"

  namespace :admin do
    get '/dashboard', to: "base#dashboard"
    resources :orders, only: [:index, :update, :show]
    resources :items, only: [:index, :edit, :update]
  end

  resources :items, only: [:index, :show]
  resource :cart, only: [:show, :create, :destroy, :update]
  resources :users, only: [:new, :create, :edit, :update]
  resources :orders, only: [:index, :show, :create]
  resources :categories, only: [:index]
  get    '/dashboard',          to: "base#dashboard"
  get    '/login',              to: 'sessions#new'
  post   '/login',              to: 'sessions#create'
  delete '/logout',             to: 'sessions#destroy'
	patch  '/cart/add',           to: "carts#add"
	patch	 '/cart/subtract',      to: "carts#subtract"
  get    "/auth/google_oauth2/callback", to: "sessions#create"

  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root to: "home#show"
  get    '/:title',        to: 'categories#show'
end
