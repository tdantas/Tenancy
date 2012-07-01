class ApplicationController < ActionController::Base
  include Tenantable::Controller
  protect_from_forgery
  
  use_public_schema_for Account

end
