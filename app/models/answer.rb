class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :post
  belongs_to :answerer, class_name: :user
  has_many :comments, as: :commentable
end
