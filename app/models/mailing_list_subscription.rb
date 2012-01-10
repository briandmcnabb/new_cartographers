class MailingListSubscription < MadMimi
  include ActiveModelShim

  # Initializer
  def initialize
    @api_settings = { username: ENV['MADMIMI_USERNAME'], api_key: ENV['MADMIMI_API_KEY'] }
  end


  # Accessors
  attr_accessor :email, :captcha


  # Validations
  validates :email,   presence: true,
                      format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  validates :captcha, absence: true
  
  
  
  class << self
    def subscribe(email, list=ENV['MADMIMI_DEFAULT_LIST'])
      self.new.add_to_list(email, list)
    end
    
    def unsubscribe(email, list=ENV['MADMIMI_DEFAULT_LIST'])
      self.new.remove_from_list(email, list)
    end
  end
end