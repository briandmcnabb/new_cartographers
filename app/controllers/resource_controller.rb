class ResourceController < ApplicationController
  inherit_resources
  respond_to :html
#  self.responder = ApplicationResponder
end