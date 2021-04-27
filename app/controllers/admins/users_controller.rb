class Admins::UsersController < ApplicationController
  before_action :authenticate_admin! # adminがログイン中のみ許可する

  def index
    @users = User.page(params[:page]).reverse_order.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def update
    @user = User.find(params[:id]) # @userに対象のuserの情報をを入れ
    @user.update(user_params) # @userのis_deletedをtrueにupdate
    redirect_to admins_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :introduction, :profile_image, :phone_number, :is_deleted)
  end
end
