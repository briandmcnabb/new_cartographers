class MailingListSubscriptionsController < ApplicationController

  def create
    @mailing_list_subscription = MailingListSubscription.subscribe(params[:mailing_list_subscription][:email])
    redirect_to :back
  end
  
  def destroy
    @mailing_list_subscription = MailingListSubscription.unsubscribe(params[:mailing_list_subscription][:email])
    redirect_to :back
  end
  
end