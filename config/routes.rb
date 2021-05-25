Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users

  resources :supporters, except: [:destroy]
  resources :managers, except: [:destroy]

  resources :locations
  resources :harvests
  resources :offerings do
    member { post :publish }
    resources :offers, only: [:create, :update, :destroy]
  end
end
