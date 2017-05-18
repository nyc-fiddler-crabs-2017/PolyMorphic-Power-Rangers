class Answer < ActiveRecord::Base
  has_one :vote, as: :votable
  belongs_to :post
  belongs_to :answerer, class_name: :user
  has_many :comments
end
