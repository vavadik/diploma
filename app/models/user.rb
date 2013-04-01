class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  validates :name, :length => { :minimum => 4 }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :password, :confirmation => true
end
