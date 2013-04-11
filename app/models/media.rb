class Media < ActiveRecord::Base
  attr_accessible :name, :data, :description, :mediatype_id, :user_id

  belongs_to :mediatype
  belongs_to :user
end
