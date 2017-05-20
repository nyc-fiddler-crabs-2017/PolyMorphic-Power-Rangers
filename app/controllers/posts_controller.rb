get '/posts' do
  @posts = Post.all
  erb :'posts/index_test'
end

get '/posts/new' do
  ensure_login_access
  erb :'posts/new'
end

post '/posts' do

  ensure_login_access
  @posts = Post.new(params[:posts])

  if @posts.save
    redirect "/posts/#{@posts.id}"
  else
    @errors = @posts.errors.full_messages
    erb :'/posts/new'
  end
end

get '/posts/:id' do
  @posts = find_and_ensure_post(params[:id])
  @current_user = current_user
   # binding.pry
  erb :'/posts/show'
end

get '/posts/:id/edit' do
  @posts = find_and_ensure_post(params[:id])
  erb :'/posts/edit'
end

get '/posts/:id/edit' do
  # binding.pry
  @posts = find_and_ensure_post(params[:id])
  erb :'posts/edit'
end

put '/posts/:id' do
  @posts = find_and_ensure_post(params[:id])
  @posts.assign_attributes(params[:posts])

  if @posts.save
    redirect "posts/#{@posts.id}"
  else
    @errors = @posts.errors.full_messages
    erb :'/posts/edit'
  end
end

delete '/posts/:id' do
  @posts = find_and_ensure_post(params[:id])
  @posts.destroy
  redirect '/'
end

post '/posts/:id/upvote' do
  ensure_login_access
  post = Post.find(params[:id])
  user = User.find(session[:user_id])

  if post.votes.where(upvote: true, user_id: user.id).count == 0
    if post.votes.where(upvote: false, user_id: user.id).count != 0
      post.votes.find_by(upvote: false, user_id: user.id).update_attributes(upvote: true)
    end
    post.votes.create(upvote: true, user_id: user.id)
    post.votes.where(upvote: false).last.destroy
  else
    post.votes.find_by(upvote: true, user_id: user.id).destroy
  end
  redirect "/posts/#{post.id}"
end


post '/posts/:id/downvote' do
  post = Post.find(params[:id])
  user = User.find(session[:user_id])

  if post.votes.where(upvote: false, user_id: user.id).count == 0
    if post.votes.where(upvote: true, user_id: user.id).count != 0
      post.votes.find_by(upvote: true, user_id: user.id).update_attributes(upvote: false)
    end
    post.votes.create(upvote: false, user_id: user.id)
    post.votes.where(upvote: true).last.destroy
  else
    post.votes.find_by(upvote: false, user_id: user.id).destroy
  end

  redirect "/posts/#{post.id}"
end
