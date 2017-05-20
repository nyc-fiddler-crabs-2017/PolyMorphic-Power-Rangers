helpers do
  def find_and_ensure_post(id)
    posts = Post.find_by(id: id)
    halt(404, erb(:"_404")) if posts.nil?
    posts
  end

  def is_post_creator?(post_id, user_id)
    post = Post.find(post_id)
    creator = User.find(post.creator_id)
    creator.id == user_id ? true : false
  end

  def is_answer_creator?(answer_id, user_id)
      answer = Answer.find(answer_id)
      creator = User.find(answer.answerer_id)
      creator.id == user_id ? true : false
    end

    def is_comment_creator?(comment_id, user_id)
        comment = Comment.find(comment_id)
        creator = User.find(comment.commenter_id)
        creator.id == user_id ? true : false
      end

  def ensure_post_creator(post_id, user_id)
    if is_post_creator?(post_id, user_id) == false
      halt(404, erb(:"_404"))
    end
  end

  def ensure_login_access
    if logged_in? == false
      halt(404, erb(:"_404"))
    else
      return true
    end
  end

end
