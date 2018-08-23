class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, length: { maximum: 500 }
  validates :content, presence: true
end
