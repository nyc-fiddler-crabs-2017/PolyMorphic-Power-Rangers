class User < ActiveRecord::Base
  has_many :posts
  has_many :answers
  has_many :comments

  validates :posts, :answers, :comments, {presence: true}

  has_secure_password
end
