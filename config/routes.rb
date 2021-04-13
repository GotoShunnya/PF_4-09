Rails.application.routes.draw do
  devise_for :users

  root to: "users#top"
  get "users/about"
  get "users/leave"
  patch "users/withdraw"

  resources :users, only: [:show, :edit, :update]

  resources :posts, only: [:new, :index, :create, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  end
end
