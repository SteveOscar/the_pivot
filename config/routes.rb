Rails.application.routes.draw do
  resources :cart_staches, only: [:create]
  resource :cart, only: [:show]
  resources :staches, only: [:index, :show]
  resources :categories, only: [:index, :show]

  root 'categories#index'
end
