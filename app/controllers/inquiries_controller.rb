class InquiriesController < ResourceController
  def create
    create!{ root_url }
  end
end