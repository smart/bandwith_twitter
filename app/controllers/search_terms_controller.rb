class SearchTermsController < ApplicationController
  resource_controller
  belongs_to :account
  
  before_filter :require_user
    
  layout false
  
  create do
    wants.json {render :json => {:timeline => {:screen_name => object[:screen_name]}}, :status => :created}
    failure.wants.json {render :json => object.errors.full_messages, :status => :unprocessable_entity}
  end
  
  def object_name
    'search_term'
  end
  
  def parent_object
    current_user
  end
  
  def build_object
    @object ||= UserTwitterSearchTerm.new(object_params.merge({
      :user_id => current_user
    }))
  end
end
