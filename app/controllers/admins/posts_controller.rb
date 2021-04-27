class Admins::PostsController < ApplicationController
  before_action :authenticate_admin! # adminがログイン中のみ許可する

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to admins_user_path(@post.user.id) # 削除する投稿に紐づいたユーザの詳細ページへ
    else
      render :show
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
