class Admins::PostCommentsController < ApplicationController
  before_action :authenticate_admin! # adminがログイン中のみ許可する

  def destroy
    @post = Post.find(params[:post_id]) #処理後redirect_toを行うため、取得。

    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    if redirect_to admins_post_path(@post), notice: "コメントを削除しました。"

    else
      flash.now[:alert] = "コメントの削除に失敗しました。 再度実行してください。"
      render "posts/show"
    end
  end
end
