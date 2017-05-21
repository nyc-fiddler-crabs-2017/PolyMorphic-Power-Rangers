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
    redirect '/'
  else
    @errors = ["Email already taken"]
    erb :'/users/new'
  end
end

# get "/users" do
#   "user profile page"
# end

get '/users/:id' do
  @user = User.find(params[:id])
  @posts = Post.where(creator: @user)
  erb :'users/show'
end
