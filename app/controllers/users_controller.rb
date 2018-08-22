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
end
