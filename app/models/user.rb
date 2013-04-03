class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  validates :name, :presence => true, :length => { :maximum => 100 }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }, :presence => true, :uniqueness => true
  validates :password, :presence => true

  after_initialize :init

  def init
    self.prev ||= 0.0     
  end

  def admin?
  	self.prev == 2
  end

  def moderator?
  	self.prev == 1
  end

  def user?
  	self.prev == 0
  end

  def role
  	case self.prev
  	  when 1
  	  	'moderator'
  	  when 2
  	  	'admin'
  	  else
  	  	'user'
  	end
  end
end
