get "/" do
  @posts = Post.all
  erb :index
end

post "/" do
  redirect "/"
end
