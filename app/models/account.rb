class Account < ActiveRecord::Base
  include Tenantable::Schema::Model
  attr_accessible :name, :schema
  schema :public
  
  after_validation :generating_schema_name
  
  def generating_schema_name
    self.schema = generate_schema_UUID if self.schema.blank?
  end
  
  def current_schema
    self.schema
  end
  
  def provisioning
    schema_bounded do
      load "#{Rails.root}/db/schema.rb"
      load "#{Rails.root}/db/seeds.rb"
    end
  end
  
  
end
