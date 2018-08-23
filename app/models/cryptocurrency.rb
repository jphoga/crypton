class Cryptocurrency < ApplicationRecord
  acts_as_favoritable

  def total_owned_value(ownedcurrency)
    market_price * ownedcurrency.quantity
  end
end
