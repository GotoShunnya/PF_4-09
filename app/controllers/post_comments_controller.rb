class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])

    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    if @post_comment.save
      redirect_to post_path(@post), notice: "コメントが保存されました。"
    else
      flash.now[:alert] = "コメントの保存に失敗しました。"
      render "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    if redirect_to post_path(@post), notice: "コメントを削除しました。"

    else
      flash.now[:alert] = "コメントの削除に失敗しました。 再度実行してください。"
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
