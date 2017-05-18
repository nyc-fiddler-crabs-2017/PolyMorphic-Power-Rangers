module PostsControllerHelper
  def find_and_verify_post(id)
    posts = posts.find_by(id: id)
    halt(404, erb(:'user/_errors')) if posts.nil?
    posts
  end
end

helpers PostsControllerHelper
