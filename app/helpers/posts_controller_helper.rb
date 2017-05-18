module PostsControllerHelper
  def find_and_verify_post(id)
    entry = posts.find_by(id: id)
    halt(404, erb(:'404')) if posts.nil?
    posts
  end
end

helpers PostsControllerHelper
