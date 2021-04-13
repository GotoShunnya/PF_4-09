class UsersController < ApplicationController
  def top
  end

  def about
  end

  def show
    @user = User.find(params[:id])
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
    @user = current_user #@userにcurrent_userを入れ
    @user.update(is_deleted: true) #@userのis_deletedをtrueにupdate
    reset_session #すべてのセッション情報を削除（ログアウトさせる。）
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :name_kana, :email, :introduction, :profile_image, :phone_number, :is_deleted)
    end
end
