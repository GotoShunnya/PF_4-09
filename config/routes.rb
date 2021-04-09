Rails.application.routes.draw do
  devise_for :users

 root to: "users#top"
 get "users/about"

end
