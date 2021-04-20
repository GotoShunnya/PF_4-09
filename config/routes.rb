Rails.application.routes.draw do

  devise_for :users

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  root to: "users#top"
  get "users/about"
  get "users/leave"
  patch "users/withdraw"

  get "search/search"

  get "inquiries/new"
  post "inquiries/back"
  post "inquiries/confirm"
  post "inquiries/thanks"

  resources :users, only: [:show, :edit, :update]
  
  resources :posts, only: [:new, :index, :create, :show, :destroy] do
    resources :favorites, only: [:index]
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
    
  namespace :admins do
    resources :users, only: [:index, :show, :update]
    resources :posts, only: [:show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end
end