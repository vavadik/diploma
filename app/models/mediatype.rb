class Mediatype < ActiveRecord::Base
  attr_accessible :name

  has_many :medias, dependent: :destroy
end
