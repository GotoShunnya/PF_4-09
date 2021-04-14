class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image

  def favorited_by?(user) #引数で渡されたユーザidが、favoritesテーブルに存在するかを調べるメソッドを作成
    favorites.where(user_id: user.id).exists?
  end

end
