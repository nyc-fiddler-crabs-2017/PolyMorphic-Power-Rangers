class Vote < ActiveRecord::Base
  belongs to :votable, polymorphic: true
end
