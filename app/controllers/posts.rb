get '/posts' do
  @posts = posts.most_recent
  erb :'users/index'
end

post '/posts' do
  ensure_login_access
  @posts = Post.new(params[:posts])

  if @posts.save
    redirect "/posts/#{@posts.id}"
  else
    @errors = @posts.errors.full_messages
    erb :'posts/new'
  end
end

get '/posts/new' do
  ensure_login_access
  erb :'posts/new'
end

get '/posts/:id' do
  ensure_login_access
  @posts = find_and_ensure_post(params[:id])
  @current_user = current_user
  erb :'posts/show'
end

put '/posts/:id' do
  @posts = find_and_ensure_post(params[:id])
  @posts.assign_attributes(params[:posts])
  
  if @posts.save
    redirect "posts/#{@posts.id}"
  else
    @errors = @posts.errors.full_messages
    erb :'posts/edit'
  end
end

delete '/posts/:id' do
  @posts = find_and_ensure_post(params[:id])
  @posts.destroy
  redirect '/posts'
end

get '/posts/:id/edit' do
  @posts = find_and_ensure_post(params[:id])
  erb :'posts/edit'
end
