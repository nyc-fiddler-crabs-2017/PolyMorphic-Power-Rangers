class User < ActiveRecord::Base
  has_many :posts
  has_many :answers
  has_many :comments

  validates :email, :password_digest, :username, presence: true

  has_secure_password
end
