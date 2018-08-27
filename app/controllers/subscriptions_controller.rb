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
    @subscription = Subscription.find(params[:id])
    authorize @subscription
    @subscription.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:cryptocurrency_id)
  end
end
