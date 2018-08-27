Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/news', to: 'news#index'
  get '/portfolio', to: 'portfolios#index', as: 'portfolio'
  resources :portfolios, only: [ :new, :create, :destroy ] do
    resources :ownedcurrencies, only: [:create]
  end
  resources :subscriptions, only: [:create, :destroy ]
  resources :users, only: [:show] do
    member do
      get     '/posts',         to: 'users#posts'

      post '/follow', to: 'users#follow', as: :user_follow
      post '/unfollow', to: 'users#unfollow', as: :user_unfollow

      post    '/favorites',     to: 'users#favorites'
      get     '/favorites',     to: 'users#favorites'
      delete  '/favorites',     to: 'users#remove_favorites'
    end
  end
  resources :posts do
    member do
      put '/upvote', to: 'posts#upvote'
      put '/downvote', to: 'posts#downvote'
    end
    resources :comments, only: [:create]
  end
  resources :comments, only: [:destroy]

  resources :ownedcurrencies, only: [ :index, :show, :new, :destroy ]

  require "sidekiq/web"
  authenticate :user, lambda { |u| u.present? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
