get "/users/new" do
  erb :'/users/new'
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save?
    @channels = @user.channels
    session[:user_id] = @user.id
    redirect '/users'
  else
    @errors = ["Email already taken"]
    erb :'/users/new'
  end
end

get "/users" do
  "user profile page"
end
