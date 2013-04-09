class Announce < ActiveRecord::Base
  attr_accessible :body, :prev, :title, :user_id

  belongs_to :user

  def Announce.roles
    {
      'Guest' => 0,
      'User' => 1,
      'Moderator' => 2,
      'Admin' => 3,
    }
  end

  def role
    case self.prev
      when 1
        'User'
      when 2
        'Moderator'
      when 3
        'Admin'
      else
        'Guest'
    end
  end
end
