class Post < ActiveRecord::Base
  has_many :comments
  attr_accessible :desciption, :title
  validates_presence_of :title, :desciption
end
