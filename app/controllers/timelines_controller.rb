class TimelinesController < ApplicationController
  resource_controller
  belongs_to :account
  
  before_filter :require_user
  
  def parent_model
    User
  end
  
  def parent_object
    current_user
  end
end
