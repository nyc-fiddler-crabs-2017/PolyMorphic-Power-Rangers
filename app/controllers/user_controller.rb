get "/users/new" do
  erb :'/users/new'
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
