class User < ActiveRecord::Base
  has_many :posts
  has_many :answers
  has_many :comments, foreign_key: :commenter_id

  has_secure_password
end
