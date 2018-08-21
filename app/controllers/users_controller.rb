class UsersController < ApplicationController
  def edit_email
    @user = current_user
  end

  def update_account_email
    @user = current_user
    @user.password_not_needed= true
    @user.email = params[:address]

    if @user.save
      flash[:notice] = "your login email"
    else
      flash[:alert] = "ooops, we were unable to activate your new login email. #{user.errors}"
    end
      redirect_to edit_user_path
  end

  def verify_email
    @user= current_user
    @address =params[:address]
  end
end

