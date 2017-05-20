get '/posts/:post_id/answers/new' do
  @post = Post.find(params[:post_id].to_i)
  erb :'answers/new'
end

post '/posts/:post_id/answers' do
  @post = Post.find(params[:post_id])
  @user = current_user
  @answer = @post.answers.new(body: params[:answer], answerer: @user)
  if @answer.save
    redirect "/posts/#{@post.id}"
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
