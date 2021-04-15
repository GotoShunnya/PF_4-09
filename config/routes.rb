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
      get "users/leave"
    end



  resources :posts, only: [:new, :index, :create, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  get 'search/search'

end
