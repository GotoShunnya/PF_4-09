class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  acts_as_taggable

  validates :title, length: { minimum: 5 }
  validates :body, length: { in: 20..100 }

  def favorited_by?(user) # 引数で渡されたユーザidが、favoritesテーブルに存在するかを調べるメソッドを作成
    favorites.where(user_id: user.id).exists?
  end
end
