class Portfolio < ApplicationRecord
  has_many :ownedcurrencies, dependent: :destroy
  has_many :cryptocurrencies, through: :ownedcurrencies
  belongs_to :user
end
