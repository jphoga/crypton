class Portfolio < ApplicationRecord
  has_many :ownedcurrency, dependent: :destroy
  belongs_to :user
end
