class SubscriptionsController < ApplicationController
  before_filter :require_login, except: [:show]

  def new
    @subscription = Subscription.new
  end

  def index
    @subscriptions = Subscription.all
  end


  def create
    @subscription = Subscription.new(subscription_params)
    @user = current_user

    if @subscription.save
      redirect_to report_path(@subscription.report), notice: 'Subscription added, thank you!'
    else
      redirect_to report_path(@subscription.report),
      notice: "The subscription did not save. Make sure you're not already subscribed."
    end

  end


  private
  def subscription_params
    params.require(:subscription).permit(:user_id, :report_id)
  end
end
