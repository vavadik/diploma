class Chat < ActiveRecord::Base
  attr_accessible :text, :user_id

  belongs_to :user
end
