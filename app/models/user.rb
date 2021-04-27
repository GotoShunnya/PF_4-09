class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  validates :name, uniqueness: true, length: { in: 2..10 } # 2~10文字以内で保存、一意性を持たせる。
  validates :name_kana, length: { in: 2..20 }
  validates :introduction, length: { in: 5..200 }
  validates :phone_number, presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze # メールアドレスの正規表現の定義
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX } # 空では×、一意性を持たせ且つ、定義した正規表現でないと保存されない。

  has_many :posts, dependent: :destroy # あるuserが削除されると、紐づけているモデルの情報も消される。
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def active_for_authentication? # is_drletedがtrueのユーザをはじく処理を作成
    super && (is_deleted == false) # is_deletedがfalseならtrueを返す
  end

  def user_status # adminのステータス表示に使用
    if is_deleted == false
      "有効"
    elsif is_deleted == true
      "退会済み"
    end
  end
end
