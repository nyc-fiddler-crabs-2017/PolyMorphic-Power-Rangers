get "/users/new" do
  erb :'/users/new'
end

post "/users" do
  @user = User.new(params[:user])
  binding.pry
  if @user.save
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

get '/users/:id' do

  erb :'users/show'
end
