class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = policy_scope(Post).order("created_at DESC").take(10)
    @post = Post.new
    @articles = Article.all
    @cryptocurrencies = Cryptocurrency.all
    @comment = Comment.new
  end
end
