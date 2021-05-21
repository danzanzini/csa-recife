Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :users, except: [:destroy]
  resources :locations
  resources :harvests
  resources :offerings do
    resources :offers, only: [:create, :update, :destroy]
  end
end
