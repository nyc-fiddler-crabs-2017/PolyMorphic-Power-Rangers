# redirect to post showing all comments (?)
# get '/posts/:post_id/comments' do
#   @post = Post.find(params[:post_id])
#   @comments = @post.comments
#   erb :'comments/index'
# end

get '/posts/:post_id/comments/new' do
  @post = Post.find(params[:post_id])
  erb :'comments/new'
end

post '/posts/:post_id/comments' do
  # binding.pry
  @post = Post.find(params[:post_id])
  @user = current_user
  @comment = @post.comments.new(body: params[:comment], commenter: @user)
  # binding.pry
  if @comment.save
    redirect "/posts/#{@post.id}"
  else
    erb :'comments/new'
  end
end

get '/posts/:post_id/comments/:id/edit' do
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  erb :'comments/edit'
end

put '/posts/:post_id/comments/:id' do
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  if @comment.update_attributes(params[:comment])
    redirect "/posts/#{@post.id}/comments"
  else
    erb :'comments/edit'
  end
end

delete '/posts/:post_id/comments/:id' do
  @post = Post.find(params[:post_id])
  @comment = @post.comments.find(params[:id])
  @comment.destroy
  redirect "/posts/#{@post.id}/comments"
end

get '/answers/:answer_id/comments/new' do
  @answer = Answer.find(params[:answer_id])
  erb :'answers/comments/new'
end

 post '/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])
  @answer.comments.create(body: params[:comment])
  @answer.post_id

  redirect "/posts/#{@answer.post_id}"
end
