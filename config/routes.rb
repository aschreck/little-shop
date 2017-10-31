Rails.application.routes.draw do
  resources :items, only: [:index]
  resource :cart, only: [:show, :create, :destroy]
  get "/:title", to: "category#show"
end
