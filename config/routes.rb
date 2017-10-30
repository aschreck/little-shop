Rails.application.routes.draw do
  resources :items, only: [:index]
  get "/:title", to: "category#show"
end
