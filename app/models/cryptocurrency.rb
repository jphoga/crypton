class Cryptocurrency < ApplicationRecord
  acts_as_favoritable
  has_many :subscriptions, dependent: :destroy

  def total_owned_value(ownedcurrency)
    if market_price == nil
      return 0
    else
      return market_price * ownedcurrency.quantity
    end
  end
end
