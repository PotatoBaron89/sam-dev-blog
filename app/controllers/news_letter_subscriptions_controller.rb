class NewsLetterSubscriptionsController < ApplicationController
  def create
    @news_letter_subscription = NewsLetterSubscription.new(news_letter_subscription_params)
    if @news_letter_subscription.save
      flash[:notice] = 'You have successfully subscribed to the newsletter'
      redirect_to request.referrer
    else
      flash[:alert] = 'There was a problem subscribing to the newsletter, please try again'
    end
  end

  private

  def news_letter_subscription_params
    params.require(:news_letter_subscription).permit(:email)
  end
end
