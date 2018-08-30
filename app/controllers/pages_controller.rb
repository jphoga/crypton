class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = policy_scope(Post)
    @post = Post.new
    @articles = Article.all
    @cryptocurrencies = Cryptocurrency.all.order("name")
    @comment = Comment.new
    @subscription = Subscription.new
  end

  def prices
    @cryptocurrencies = Cryptocurrency.all.order("name")
    @subscription = Subscription.new
    respond_to do |format|
      format.js
      # format.html { render :new }
    end
  end
end
