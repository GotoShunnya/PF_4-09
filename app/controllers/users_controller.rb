class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about, :show] # ログイン中のみ許可する(exceptで選択したアクションは除く)

  def top
  end

  def about
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc) # userに紐づくpostを取得。同時にリストの昇順・kaminariの設定
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def leave
    @user = current_user
  end

  def withdraw
    @user = current_user # @userにcurrent_userを入れ
    @user.update(is_deleted: true) # @userのis_deletedをtrueにupdate
    reset_session # すべてのセッション情報を削除（ログアウトさせる。）
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :introduction, :profile_image, :phone_number, :is_deleted)
  end
end
