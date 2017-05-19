helpers do
  def find_and_ensure_post(id)
    posts = Post.find_by(id: id)
    halt(404, erb(:_errors)) if posts.nil?
    posts
  end

  def is_post_creator?(post_id, user_id)
    post = Post.find(post_id)
    creator = User.find(post.user_id)
    creator.id == user_id ? true : false
  end

  def ensure_post_creator(post_id, user_id)
    if is_post_creator?(post_id, user_id) == false
      halt(404, erb(:_errors))
    end
  end

  def ensure_login_access
    if logged_in? == false
      halt(404, erb(:_errors))
    else
      return "penis"
    end
  end

end
