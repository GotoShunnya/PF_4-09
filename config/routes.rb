Rails.application.routes.draw do

  devise_for :users

  devise_for :admins, controllers: {
    sessions: "admins/sessions"
  }

  root to: "users#top"
  get "users/about"
  get "users/leave"
  patch "users/withdraw"

  resources :users, only: [:show, :edit, :update]
    namespace :admins do
      resources :users, only: [:index, :show, :update]
    end

  resources :posts, only: [:new, :index, :create, :show, :destroy] do
    resources :favorites, only: [:index]
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
    namespace :admins do
      resources :posts, only: [:show, :destroy] do
        resources :post_comments, only: [:destroy]
      end
    end

  get 'search/search'

  get 'inquiries/new'
  post 'inquiries/confirm'
  post 'inquiries/thanks'

end