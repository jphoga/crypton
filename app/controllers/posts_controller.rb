class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :upvote, :downvote]
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    respond_to do |format|
      format.js
      # format.html { render :new }
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      @posts = policy_scope(Post).order("created_at DESC").take(10)
      @comment = Comment.new
      respond_to do |format|
        format.js
        # format.html { redirect_to root_path }
      end
    else
      respond_to do |format|
        format.js
        # format.html { render :new }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def upvote
    authorize @post
    @post.upvote_by current_user
    respond_to :js
  end

  def downvote
    authorize @post
    @post.downvote_from current_user
    respond_to :js
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
