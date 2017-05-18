class User < ActiveRecord::Base
  has_many :posts
  has_many :answers

  has_secure_password
end
