require 'json'
require 'open-uri'

class MarketPriceJob < ApplicationJob
  queue_as :default

  def perform

    coin_market_url = "https://api.coinmarketcap.com/v1/ticker/?limit=2000"

    response = open(coin_market_url).read
    market_prices = JSON.parse(response)

    coins = Cryptocurrency.all

    coins.each do |coin|
      market_prices.each do |market_price|
        if coin.name ==  market_price["name"]
          coin.market_price = market_price["price_usd"]
          coin.Marketcap = market_price["market_cap_usd"]
          coin.Volume = market_price["24h_volume_usd"]
          coin.Supply = market_price["total_supply"]
          coin.Change = market_price["percent_change_24h"]
          coin.rank = market_price["rank"]
          # p "updated #{coin.name}!"
          coin.save!
        end
      end
    end
  end
end
