class Account < ActiveRecord::Base
  include Tenantable::Model
  attr_accessible :name, :schema
end
