class MailingListSubscription < MadMimi
  include ActiveModelShim
  
  def initialize
    @api_settings = { :username => ENV['MADMIMI_USERNAME'], :api_key => ENV['MADMIMI_API_KEY'] }
    @default_list = ENV['MADMIMI_DEFAULT_LIST']
  end

  # Accessors
  attr_accessor :email
  
  # Validations
  validates :email, presence: true,
                    format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  
  
  
  class << self
    def subscribe(email, list=@default_list)
      self.new.add_to_list(email, list)
    end
    
    def unsubscribe(email, list=@default_list)
      self.new.remove_from_list(email, list)
    end
  end
end