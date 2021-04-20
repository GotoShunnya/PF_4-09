class FavoritesController < ApplicationController
before_action :authenticate_user!

  def index
    #@posts = Post.all
    my_favorites = Favorite.where(user_id: current_user.id)
    @posts = Post.where(id: my_favorites.pluck(:post_id))
  end

  def create
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.find_by(user_id: current_user)
    favorite.destroy
  end

end
