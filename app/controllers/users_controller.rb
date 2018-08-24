class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :posts]
  def show
    @user = User.find(params[:id])
    authorize @user

    @posts = @user.posts
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
    if @crypto && @user.favorite(@crypto)
      redirect_back(fallback_location: root_path)
      flash[:notice] = "Successfully favorited #{@crypto.name}"
    else
      flash[:alert] = "Something went wrong"
    end
  end

end
