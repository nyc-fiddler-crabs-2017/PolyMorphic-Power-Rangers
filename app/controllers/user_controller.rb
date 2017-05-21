get "/users/new" do
  if request.xhr?
    erb :'/users/new', layout: false
  else
    erb :'/users/new'
  end
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    if request.xhr?
      erb :_logged_in, layout: false
    else
      redirect '/'
    end
  else
    @errors = ["Email already taken"]
    redirect '/404'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @posts = Post.where(creator: @user)
  erb :'users/show'
end
