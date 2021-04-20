class FavoritesController < ApplicationController
before_action :authenticate_user!

  def index
    my_favorites = Favorite.where(user_id: current_user.id) #current_userのfavoriteのidを全権取得
    @posts = Post.where(id: my_favorites.pluck(:post_id)) #先に取得したfavoriteのidに紐づくpost_idを全権取得し、@postに格納。
  end                                                     #pluckメソッドは引数に指定したカラムの値を、配列で返してくれる。

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
