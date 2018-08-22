require 'json'
require 'open-uri'

class NewsApiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Starting job searching for news"
    url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=9d89b4c8e6574b3685109b85a70f9fc5"

    if Article.count > 50
      Article.first(20).each { |a| a.destroy }
    end

    response = open(url).read
    articles = JSON.parse(response)

    articles["articles"].each do |article|
      Article.create(
        author: article["author"],
        image_url: article["urlToImage"],
        title: article["title"],
        description: article["description"],
        news_url: article["url"],
        publishedAt: article["publishedAt"]
      )
      puts "Created your articles!"
    end
  end
end
