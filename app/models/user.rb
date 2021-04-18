class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :posts, dependent: :destroy #あるuserが削除されると、紐づけているモデルの情報も消される。
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def active_for_authentication? #is_drletedがtrueのユーザをはじく処理を作成
    super && (self.is_deleted == false) #is_deletedがfalseならtrueを返す
  end

  def user_status #adminのステータス表示に使用
    if is_deleted == false
      "有効"
    elsif is_deleted == true
      "退会済み"
    end
  end

end
