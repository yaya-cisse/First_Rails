class User < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :posts
end
