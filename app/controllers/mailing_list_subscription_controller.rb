class MailingListSubscriptionController < ResourceController
  actions only: [:create, :destroy]

  def create
    @mailing_list_subscription = MailingList.subscribe(params[:email])
    create!
  end
  
  def destroy
    @mailing_list_subscription = MailingList.unsubscribe(params[:email])
    destroy!
  end
  
end