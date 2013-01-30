class Comment < ActiveRecord::Base
  belongs_to :post, :touch => true
  attr_accessible :body
  validates_presence_of :body
end
