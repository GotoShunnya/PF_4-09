class Inquiry < ApplicationRecord
  validates :name, length: { in: 2..10 } # 2~10文字以内で保存

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze # メールアドレスの正規表現の定義
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX } # 空では×、一意性を持たせ且つ、定義した正規表現でないと保存されない。

  validates :message, length: { minimum: 20 } # 20文字以上で保存
end
