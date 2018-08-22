class Cryptocurrency < ApplicationRecord
  def total_owned_value(ownedcurrency)
    market_price * ownedcurrency.quantity
  end
end
