class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
  end

  def index
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}").order(created_at: :desc).page(params[:page]).reverse_order
    else
      @posts = Post.all.order(created_at: :desc).page(params[:page]).reverse_order#1ページで決められた件数だけを、新しく取得する
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    else
      render :show
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :image, :tag_list)
  end

end
