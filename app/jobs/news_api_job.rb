require 'json'
require 'open-uri'

class NewsApiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    newsapi_url = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=9d89b4c8e6574b3685109b85a70f9fc5"
    reddit_url = "https://www.reddit.com/r/CryptoCurrency/hot/.json"

    Article.destroy_all

    response_newsapi = open(newsapi_url).read
    articles_newsapi = JSON.parse(response_newsapi)

    articles_newsapi["articles"].each do |article|
      Article.create(
        author: article["author"],
        image_url: article["urlToImage"],
        title: article["title"],
        description: article["description"],
        news_url: article["url"],
        publishedAt: article["publishedAt"],
        source: article["source"]["name"]
      )
      p "finished article #{article["title"]}!"
    end

    response_reddit = open(reddit_url, 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36').read
    articles_reddit = JSON.parse(response_reddit)

    reddit = []
    articles_reddit["data"]["children"].each do |children|
      reddit << children["data"]
    end


    reddit.each do |article|
      Article.create(
        xauthor: article["author"],
        ximage_url: article["urlToImage"],
        title: article["title"],
        xdescription: article["description"],
        xnews_url: article["url"],
        xpublishedAt: article["publishedAt"],
        xsource: article["source"]["name"]
      )
    end
  end
end
