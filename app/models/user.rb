class User < ActiveRecord::Base
  has_many :posts, foreign_key: :creator_id
  has_many :answers, foreign_key: :answerer_id
  has_many :comments, foreign_key: :commenter_id

  has_secure_password
end
