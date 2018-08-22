class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @posts = policy_scope(Post).order("created_at DESC")
  end

  def new
    @post = Post.new
    authorize @post
    @comment = Comment.new(post_id: params[:post_id])
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params)
    authorize @post

    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
