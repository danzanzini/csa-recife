Rails.application.routes.draw do
  resources :locations
  root to: 'welcome#index'

  devise_for :users

  devise_scope :user do
    get 'users', to: 'users/registrations#index'
  end

  resources :harvests
  resources :offerings do
    resources :offers, only: [:create, :update, :destroy]
  end

end
