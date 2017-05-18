get '/posts' do
  @post = posts.most_recent
  erb :'posts/index'
end

post '/posts' do
  binding.pry
  @posts = current_user.posts.create(params[:posts])
  @current = current_user.find(@posts.user_id)
  @current.username
  if @posts.save
    redirect "/posts/#{@posts.id}"
  else
    @errors = @posts.errors.full_messages
    erb :'posts/new'
  end
end

get '/posts/new' do
  if current_user
    erb :'posts/new'
  else
    erb :'404'
  end
end

get '/posts/:id' do
  @posts = find_and_verify_post(params[:id])
  erb :'posts/show'
end

put '/posts/:id' do
  @posts = find_and_verify_post(params[:id])

  if @posts.save
    redirect "posts/#{@posts.id}"
  else
    @errors = @posts.errors.full_messages
    erb :'posts/edit'
  end
end

delete '/posts/:id' do
end
  @posts = find_and_ensure_[posts](params[:id])
  @posts.destroy
  redirect '/posts'
end

get '/posts/:id/edit' do
  @posts = find_and_ensure_[posts](params[:id])
  erb :'posts/edit'
end