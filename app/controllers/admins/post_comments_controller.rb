class Admins::PostCommentsController < ApplicationController
  before_action :authenticate_admin! #adminがログイン中のみ許可する

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
