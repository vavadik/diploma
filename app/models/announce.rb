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
end
