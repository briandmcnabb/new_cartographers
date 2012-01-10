class Inquiry < ActiveRecord::Base

# Accessors
attr_accessible :name, :organization, :email, :project_type, :budget, :description, :mailing_list
attr_accessor :mailing_list

# Callbacks
after_create :sign_up_for_mailing_list

# Validations
validates :name,        presence: true
validates :email,       presence: true,
                        format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
validates :description, presence: true



  protected
  
  def sign_up_for_mailing_list
    MailingListSubscription.subscribe(email) if mailing_list
  end
    
end