class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user = current_user
    authorize @subscription
    if @subscription.save
      redirect_to root_path
    else
      flash[:alert] = "Subscription could not be created"
      redirect_to root_path
    end
  end

  def destroy
    @user = current_user
    authorize @user
    @crypto = Cryptocurrency.find(params[:cryptocurrency_id])
    @crypto.subscription = @subscription

    redirect_back(fallback_location: root_path)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:cryptocurrency_id)
  end
end
