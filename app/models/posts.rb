class Post < ActiveRecord::Base
  has_one :vote, as: :votable
  belongs_to :creator, class_name: :user
  has_many :answers

end

