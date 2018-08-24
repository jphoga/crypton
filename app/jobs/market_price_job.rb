require 'json'
require 'open-uri'

class MarketPriceJob < ApplicationJob
  queue_as :default

  def perform(*args)

    coin_market_url = "https://api.coinmarketcap.com/v1/ticker/?limit=2000"

    response = open(coin_market_url).read
    market_prices = JSON.parse(response)

    coins = Cryptocurrency.all

    coins.each do |coin|
      market_prices.each do |market_price|
        if coin.name ==  market_price["name"]
          coin.market_price = market_price["price_usd"]
          p "updated #{coin.name}!"
        end
      end
    end
  end
end
