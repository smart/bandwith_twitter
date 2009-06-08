class PagesController < ApplicationController
  before_filter :require_user, :except => [:index]
  
  def index
  end
  
  def twitter
  end
end
