class ApplicationController < ActionController::Base
  include Tenantable::Controller
  protect_from_forgery
  
  use_public_schema_for Account, User
  
  before_filter :authenticate_user!
  before_filter :setup_schema, :unless => :devise_controller?
  
  protected
  def current_schema
    current_user.account.schema
  end
end
