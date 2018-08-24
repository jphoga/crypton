class Cryptocurrency < ApplicationRecord
  acts_as_favoritable

  def total_owned_value(ownedcurrency)
    if market_price == nil
      return 0
    else
      return market_price * ownedcurrency.quantity
    end
  end
end
