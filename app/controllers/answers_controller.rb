get '/posts/:post_id/answers/new' do
  @answer = Post.find(params[:post_id])
  erb :'answers/new'
end

post '/posts/:post_id/answers' do
  @post = Post.find(params[:post_id])
  @answer = @post.answers.new(params[:answer])
  if @answer.save
    redirect "/posts/#{@post.id}/answers"
  else
    erb :'answers/new'
  end
end

get '/posts/:post_id/answers/:id/edit' do
  @post = Post.find(params[:post_id])
  @answer = @post.answers.find(params[:id])
  erb :'answers/edit'
end

put '/posts/:post_id/answers/:id' do
  @post = Post.find(params[:post_id])
  @answer = @post.answers.find(params[:id])
  if @answer.update_attributes(params[:answer])
    redirect "/posts/#{@post.id}/answers"
  else
    erb :'answers/edit'
  end
end

delete '/posts/:post_id/answers/:id' do
  @post = Post.find(params[:post_id])
  @answer = @post.answers.find(params[:id])
  @answer.destroy
  redirect "/posts/#{@post.id}/answers"
end
