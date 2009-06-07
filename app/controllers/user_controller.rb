class UserController < ApplicationController
  resource_controller :singleton
  actions :new, :create, :show, :edit, :update, :destroy
  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  
  new_action do
    wants.html
    wants.json {render :json => object}
  end
  
  create do
    wants.html {redirect_to(object_url)}
    wants.json {render :json => object, :status => :created, :location => object}
    
    failure.wants.html {render :action => :new}
    failure.wants.json {render :json => object.errors, :status => :unprocessable_entity}
  end
  
  show do
    wants.html
    wants.json {render :json => object}
    
    failure.wants.html {render :text => "Object not found", :status => 404}
    failure.wants.json {head :not_found}
  end
  
  update do
    wants.html {redirect_to(object_url)}
    wants.json {render :json => object}
    
    failure.wants.html {render :action => :edit}
    failure.wants.json {render :json => object.errors, :status => :unprocessable_entity}
  end
  
  destroy do
    wants.html {redirect_to(account_url)}
    wants.json {head :ok}
  end
  
  def object
    @object ||= current_user
    @object
  end
  
  def route_name
    'account'
  end
end
