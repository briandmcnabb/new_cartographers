require 'active_model'

# This the module which makes any class behave like ActiveModel.
module ActiveModelShim
  def self.included(base)
    base.class_eval do
      extend ActiveModel::Naming
      extend ActiveModel::Translation
      extend ActiveModel::Callbacks
      include ActiveModel::Validations
      include ActiveModel::Conversion

      extend ActiveModelShim::ClassMethods
    end
  end

  module ClassMethods
    def i18n_scope
      :mail_form
    end
  end

  # Initialize assigning the parameters given as hash.
  def initialize(params={})
    params.each_pair do |attr, value|
      self.send(:"#{attr}=", value)
    end unless params.blank?
  end

  # Returns a hash of attributes, according to the attributes existent in
  # self.class.mail_attributes.
  def attributes
    self.class.mail_attributes.inject({}) do |hash, attr|
      hash[attr.to_s] = send(attr)
      hash
    end
  end

  # Always return true so when using form_for, the default method will be post.
  def new_record?
    true
  end

  def persisted?
    false
  end

  # Always return nil so when using form_for, the default method will be post.
  def id
    nil
  end
end