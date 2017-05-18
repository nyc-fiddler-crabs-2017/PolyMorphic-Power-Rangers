class Post < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :creator, class_name: :user
  has_many :answers
  has_many :comments, as: :commentable
end
