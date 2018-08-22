Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/portfolio', to: 'portfolios#index', as: 'portfolio'
  resources :portfolios, only: [ :new, :create, :destroy ] do
  end
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
  resources :ownedcurrencies, only: [ :index, :show, :new, :create, :destroy ]
end
