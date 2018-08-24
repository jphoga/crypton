namespace :market_price do
  desc "TODO"
  task update: :environment do
    MarketPriceJob.perform_later
  end
end
