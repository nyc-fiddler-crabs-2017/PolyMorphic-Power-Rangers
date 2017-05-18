class Comment < ActiveRecord::Base
  has_one :vote, as: :votable
  belongs_to :answer
  belongs_to :commentable, polymorphic: true
end

