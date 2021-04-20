class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  validates :comment, length: { in: 2..150 }

end
