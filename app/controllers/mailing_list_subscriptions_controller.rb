class MailingListSubscriptionsController < ApplicationController

  def create
    @mailing_list_subscription = MailingListSubscription.new(params[:mailing_list_subscription])
    if @mailing_list_subscription.subscribe 
      redirect_to :back, notice: "Your message was successfully sent." 
    else 
      redirect_to :back
      #render root_path
    end
  end
  
  def destroy
    @mailing_list_subscription = MailingListSubscription.unsubscribe(params[:mailing_list_subscription][:email])
    redirect_to :back
  end
  
end