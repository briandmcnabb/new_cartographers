require 'active_model'

module ActiveModelShim
  def self.included(base)
    base.class_eval do
      extend ActiveModel::Naming
      extend ActiveModel::Translation
      extend ActiveModel::Callbacks
      include ActiveModel::Validations
      include ActiveModel::Conversion
      include ActiveModel::AttributeMethods

      extend ActiveModelShim::ClassMethods
    end
  end

  module ClassMethods
    # Set i18n  scope
    def i18n_scope
      :mailing_list_subscription
    end
    
    # Declare class attributes
    def attributes(*names)
      attr_accessor *names
      define_attribute_methods names
    end
  end


  # Initializer: Assign the parameters given as hash.
  def initialize(params={})
    params.each_pair do |attr, value|
      self.send(:"#{attr}=", value)
    end unless params.blank?
  end
  
  
  # Returns a hash of declared attributes
  def attributes
    self.class.attributes.inject({}) do |hash, attr|
      hash[attr.to_s] = send(attr)
      hash
    end
  end
  

  # Utility methods to force POST method when using form_fo
  def new_record?
    true
  end

  def persisted?
    false
  end

  def id
    nil
  end
  
  
  
  protected
  # Utility method to clear attribute value
  def clear_attribute(attribute)
    send("#{attribute}=", nil)
  end
  
  # Syntactical sugar for checking attribute presence
  def attribute?(attribute)
    send(attribute).present?
  end
end