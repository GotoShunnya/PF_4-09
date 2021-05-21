class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  acts_as_taggable

  validates :title, length: { in: 5..30 }
  validates :body, length: { in: 30..200 }

  def favorited_by?(user) # 引数で渡されたユーザidが、favoritesテーブルに存在するかを調べるメソッドを作成
    favorites.where(user_id: user.id).exists?
  end
end
