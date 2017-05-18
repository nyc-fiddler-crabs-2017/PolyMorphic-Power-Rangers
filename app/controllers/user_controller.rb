get "/users/new" do
  "sign up form"
end

post "/users" do
  @user = User.new(params[:user])
  if @user.save?
    @channels = @user.channels
    session[:user_id] = @user.id
    redirect '/users'
  else
    @errors = ["Email already taken"]
    erb :'users/new'
  end
end

get '/users/login' do
  "login form"
end

post '/users/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/users'
  else
    @errors = ["Email and Password do not match our records."]
    erb :'users/login'
  end
end


get "/users" do
  "user profile page"
end
