class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :posts]
  def show
    @user = User.find(params[:id])
    authorize @user

    @posts = @user.posts.order("likes DESC").take(10)
  end

  def posts
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
    authorize @posts
  end

  def favorites
    @user = current_user
    authorize @user
    unless params[:favorite][:crypto].empty?
      @crypto = Cryptocurrency.find(params[:favorite][:crypto].to_i)
    end
    if @crypto && @user.favorites_count < 12 && @user.favorite(@crypto)
      flash[:notice] = "Successfully favorited #{@crypto.name}"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_back(fallback_location: root_path)
  end

  def remove_favorites
    @user = current_user
    authorize @user
    @crypto = Cryptocurrency.find(params[:cryptocurrency_id])
    @user.remove_favorite(@crypto)
    redirect_back(fallback_location: root_path)
  end


  def subscriptions
    @user = current_user
    authorize @user
    @crypto_subscription = Cryptocurrency.find(params[:crypto].to_i)
  end


  def remove_subscriptions

  end

  def follow
    @user = User.find(params[:id])
    authorize @user
    current_user.follow(@user)
    @follow = Follow.find_by(follower: @current_user, followable: @user)
    respond_to :js
  end

  def unfollow
    @user = User.find(params[:id])
    authorize @user
    current_user.stop_following(@user)
    respond_to :js
  end

  private

  def article_params
      params.require(:user).permit(:password, :email, :photo)
  end
end
