class ApplicationController < ActionController::Base
  include Tenantable::Schema::Controller
  protect_from_forgery
  
  
  before_filter :authenticate_user!
  before_filter :setup_schema, :unless => :devise_controller?
  
  def setup_schema
    schema_search_path( current_user.account.schema )
  end
 
end
