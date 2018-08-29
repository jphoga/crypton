# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Portfolio.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?
Post.destroy_all if Rails.env.development?
Cryptocurrency.destroy_all if Rails.env.development?
Comment.destroy_all if Rails.env.development?
Ownedcurrency.destroy_all if Rails.env.development?

urldemi = "https://res.cloudinary.com/deqvblsv6/image/upload/v1535059286/demi.jpg"
urltania = "https://res.cloudinary.com/deqvblsv6/image/upload/v1535058557/tania.jpg"
urlhiroki ="https://res.cloudinary.com/deqvblsv6/image/upload/v1535058962/hiroki.jpg"
urldavid = "https://res.cloudinary.com/deqvblsv6/image/upload/v1535058874/david.png"
urljan = "https://res.cloudinary.com/deqvblsv6/image/upload/v1535058999/jan.jpg"

Demi = User.create (
  {email: "demi.lovato@gmail.com",
   password: "123456",
   remote_photo_url: urldemi}
)

Jan = User.create (
  {email: "jan@gmail.com",
   password: "123456",
   remote_photo_url: urljan}
)

Hiroki = User.create (
  {email: "hiroki@gmail.com",
   password: "123456",
   remote_photo_url: urlhiroki}
)

David = User.create (
  {email: "david@gmail.com",
   password: "123456",
   remote_photo_url: urldavid}
)

Tania = User.create (
  {email: "tania@gmail.com",
   password: "123456",
   remote_photo_url:urltania}
)

p "created 5 users"

Post.create (
  {content: "Sometimes you get the feeling that the Exchanges
   are driving prices down to make more money with people
   who invest more and more and more.",
   user: User.all.sample,
   likes: [*(1..5)].sample
   }
)

Post.create (
  {content: "Union square is kind of the capital of cryptocurrency
   in the US.”  “Do you mean NYC or SF union square?  “Yes.”",
   user: User.all.sample,
   likes: [*(1..5)].sample}
)

Post.create (
  {content: "Noah project is developed steadily. They are genius groups.
   A project is being advanced with circumspection while solidifying
    the foundation. They would make them achieve a project. It may
     be the one by which this cheapness is only now.",
   user: User.all.sample,
   likes: [*(1..5)].sample
   }
)

Post.create (
  {content: "#Cryptocurrency isn’t about getting rich quick.
  It is something far more than that.
  It’s about taking back what is ours.
  Our freedom.",
   user: User.all.sample,
   likes: [*(1..5)].sample
   }
)

Post.create (
  {content: "Save time on working out how to set up crypto currency
  mining. Just leave your oven running for 24 hours. You'll have
   the same result.",
   user: User.all.sample,
   likes: [*(1..5)].sample
   }
)


#Seed coins
Cryptocurrency.destroy_all

# coin_market_url = "https://api.coinmarketcap.com/v1/ticker/?limit=1500"

# response_coin_market = open(coin_market_url).read
# currencies_coin_market = JSON.parse(response_coin_market)

# currencies_coin_market.each do |coin|
#   Cryptocurrency.create(
#     name: coin["name"],
#     abbreviation: coin["symbol"],
#     market_price: coin["price_usd"]
#   )
# end

coin_market_cap_listings = "https://api.coinmarketcap.com/v2/listings/"

response_coin_market_listings = open(coin_market_cap_listings).read
currencies_coin_market_listings = JSON.parse(response_coin_market_listings)

currencies_coin_market_listings["data"].each do |coin|
  Cryptocurrency.create(
    coin_id: coin["id"],
    name: coin["name"],
    abbreviation: coin["symbol"],
    website_slug: coin["website_slug"]
  )
end


# p "5 posts created"

# Cryptocurrency.create( {
#                          name: "Bitcoin",
#                          market_price:  6342.04,
#                          abbreviation: "BTC"
# })

# Cryptocurrency.create (
#   {name: "Ethereum",
#    market_price: 278.28,
#    abbreviation: "ETC"}
# )

# Cryptocurrency.create ( {
#                           name: "XRP",
#                           market_price: 0.327773,
#                           abbreviation: "XRP"
# })

# Cryptocurrency.create ( {
#                           name: "EOS",
#                           market_price: 4.77,
#                           abbreviation: "EOS"
# })

# Cryptocurrency.create ( {
#                           name: "Stellar",
#                           market_price: 0.215311,
#                           abbreviation: "XLM"
# })

# Cryptocurrency.create ({
#                          name: "Litecoin",
#                          market_price: 54.59,
#                          abbreviation: "LTC"
# })

# Cryptocurrency.create ({
#                          name: "Tether",
#                          market_price: 1.00,
#                          abbreviation: "USDT"
# })

# Cryptocurrency.create ({
#                          name: "Cardano",
#                          market_price: 0.093063,
#                          abbreviation: "ADA"
# })

# Cryptocurrency.create ({
#                          name: "Monero",
#                          market_price: 93.38,
#                          abbreviation: "XMR"
# })

# Cryptocurrency.create ({
#                          name: "IOTA",
#                          market_price: 0.503882,
#                          abbreviation: "IOTA"
# })

# p "10 cryptos created"

Comment.create ({
                  content: "Spurt Plus (SPU+) owns and operates on its own Blockchain.
   Stay tuned for our Blockchain announcement, amongst other major deals
    signed off by Spu+. ",
                  user: User.all.sample,
                  post: Post.all.sample
})


Comment.create ({
                  content: "Total number of #bitcoins divided by the number of people
  on a planet is 21M/7B=0.003 #BTC. Total money supply is $90T, so for
   one person it is $90T/7B=$13k. ",
                  user: User.all.sample,
post: Post.all.sample })

Comment.create ({
                  content: "This is the problem with a world run by
  FIAT Currencies.",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "Count me in",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "Awesome opportunity to be had",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "A hugely encouraging rally from #Tezos.",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "How should governments and Central Banks think about
  monetary policy in the age of #cryptocurrencies and #cryptoassets?",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "RP and Ripple for the future! The basic thing of
  economy, money transfer should move into 2018.
   Atm it is stuck in the 70's. ",
                  user: User.all.sample,
                  post: Post.all.sample
})


Comment.create ({
                  content: "@ProfFaustus interesting thoughts about stability.
   Lucky them who already have large adoption! ;-P",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "A promising project in the crypto currency market.
   Don't miss opportunity for investments",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "Our smart contracts allow agreements to be made between users
   and ensures that the aqreements are carried out religiously.",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "I don’t understand how people can look at the things TRX has
  been doing and still think it’s going to fail. 99% sure it’s
  hey’re doing more than your shitcoin. ",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "Biggest problem with #trx is education.  Don’t think the crypto
   community understands what exactly BitTorrent can do for all crypto and
    the trx platform. The BitTorrent protocol touches so much and puts it ahead
     of most platforms. ",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "Bittorrent is everywhere..) ",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "BTC is awesome",
                  user:User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "Will not fail AT ALL!!! ,7 EOY ",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "Tron has accomplished more in 1 year than 85% of
   the coins on coinmarketcap's top 100 list no matter how long
    they've been around",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "Asian market is the most important considering
   the quantity of the population... ",
                  user: User.all.sample,
                  post: Post.all.sample
})

Comment.create ({
                  content: "ETC is cool",
                  user: User.all.sample,
                  post: Post.all.sample
})

puts "20 comments created"

10.times do
  Portfolio.create (
    {name: Faker::HarryPotter.character,
     user: User.all.sample
     }
  )
end

puts "10 portfolios created"

30.times do
  Ownedcurrency.create(
    {quantity: [*(1..500)].sample,
     cryptocurrency: Cryptocurrency.all.sample,
     portfolio: Portfolio.all.sample
     }
  )
end
puts "30 ownedcurrencies created"


Follow.create ( {
  followable: Demi,
  follower: User.all.sample
})



Follow.create ( {
  followable: Hiroki,
  follower: User.all.sample
})


Follow.create ( {
  followable: David,
  follower: User.all.sample
})


Follow.create ( {
  followable: Tania,
  follower: User.all.sample
})


Follow.create ( {
  followable: Jan,
  follower: User.all.sample
})


p "created 5 followers"
