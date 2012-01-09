class Inquiry < ActiveRecord::Base

# Accessors
attr_accessible :name, :organization, :email, :project_type, :budget, :description
attr_accessor :mailing_list

# Callbacks
before_create :sign_up_for_mailing_list



protected

def sign_up_for_mailing_list
  if mailing_list.present?
  end
end