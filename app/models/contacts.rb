class Contacts < ActiveRecord::Base
  attr_accessible :email, :name, :phone
end
