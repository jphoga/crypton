Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/portfolio', to: 'portfolios#index', as: 'portfolio'
  resources :portfolios, only: [ :new, :create, :destroy ]

  resources :posts do
    resources :comments, only: [:index, :create]
  end
  resources :comments, only: [:destroy]
end
