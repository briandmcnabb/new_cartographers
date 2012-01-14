class MailingListSubscription < MadMimi
  include PoroSeasoning::ActiveModelShiv
  extend  PoroSeasoning::ClassifyMethods
  
  
  # Initializer
  def initialize(params={})
    @api_settings = { username: ENV['MADMIMI_USERNAME'], api_key: ENV['MADMIMI_API_KEY'] }
    super
  end


  # Model attributes
  attributes :email, :captcha


  # Validations
  validates :email,   presence: true,
                      format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  validates :captcha, absence: true
  
  
  def subscribe
    return false unless valid?
    add_to_list(self.email, ENV['MADMIMI_DEFAULT_LIST'])
  end
  
  def unsubscribe
    return false unless valid?
    remove_from_list(self.email, ENV['MADMIMI_DEFAULT_LIST'])
  end
end