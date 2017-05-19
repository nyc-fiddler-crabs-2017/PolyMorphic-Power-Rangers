class Post < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :creator, class_name: "User"
  has_many :answers
  has_many :comments, as: :commentable

  def count_votes
    self.votes.count - self.votes.where(upvote: true).count
  end

  def count_answers
    self.answers.count
  end
end
