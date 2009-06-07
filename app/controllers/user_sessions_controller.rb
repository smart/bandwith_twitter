class UserSessionsController < ApplicationController
  resource_controller :singleton
  actions :new, :create, :destroy
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  new_action do
    wants.html
    wants.json {render :json => object}
  end
  
  create do
    wants.html {redirect_to('/')}
    wants.json {render :json => object, :status => :created, :location => object}
    
    failure.wants.html {render :action => :new}
    failure.wants.json {render :json => object.errors, :status => :unprocessable_entity}
  end
  
  destroy do
    wants.html {redirect_to('/')}
    wants.json {head :ok}
  end
  
  def object
    @object ||= current_user_session
    @object
  end  
end
