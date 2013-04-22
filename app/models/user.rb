class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :prev

  has_many :announces, dependent: :destroy
  has_many :medias, dependent: :destroy
  has_many :chats, dependent: :destroy

  has_secure_password
  validates :name, :presence => true, :length => { :maximum => 100 }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }, :presence => true, :uniqueness => true

  after_initialize :init

  def User.roles
    {
      'User' => 1,
      'Moderator' => 2,
      'Admin' => 3
    }
  end

  def init
    self.prev ||= 0
  end

  def admin?
  	self.prev == 3
  end

  def moderator?
  	self.prev == 2
  end

  def user?
  	self.prev == 1
  end

  def guest?
    self.prev == 0
  end

  def role
  	case self.prev
  	  when 1
  	  	'user'
  	  when 2
  	  	'moderator'
      when 3
        'admin'
  	  else
  	  	'guest'
  	end
  end
end
