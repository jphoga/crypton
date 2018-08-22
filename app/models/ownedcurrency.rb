class Ownedcurrency < ApplicationRecord
  belongs_to :cryptocurrency
  belongs_to :portfolio
  validates :quantity, :cryptocurrency_id, presence: true
  validates :cryptocurrency_id, uniqueness: { scope: :portfolio_id }
end
