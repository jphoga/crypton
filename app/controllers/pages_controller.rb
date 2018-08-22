class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @posts = policy_scope(Post).order("created_at DESC")
    @post = Post.new
    @articles = Article.all
  end
end
