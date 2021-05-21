Rails.application.routes.draw do
  resources :users
  resources :locations
  root to: 'welcome#index'

  devise_for :users

  resources :harvests
  resources :offerings do
    resources :offers, only: [:create, :update, :destroy]
  end
end
