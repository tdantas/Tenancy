class User < ActiveRecord::Base
   include Tenantable::Schema::Model
  
   devise :database_authenticatable, :registerable
   attr_accessible :account, :email, :password, :password_confirmation, :account_attributes
   belongs_to :account
   
   accepts_nested_attributes_for :account, :allow_destroy => false
   
   schema :public
   
end
