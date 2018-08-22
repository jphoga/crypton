class Portfolio < ApplicationRecord
  has_many :ownedcurrencies, dependent: :destroy
  belongs_to :user
end
