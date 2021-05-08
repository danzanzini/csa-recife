Rails.application.routes.draw do
  resources :harvests
  resources :offerings do
    resources :offers, only: [:index, :create, :update, :destroy]
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
