get '/' do
 erb :'/sessions/redirect'
end

get '/sessions/login' do
  erb :'/sessions/login'
end

post '/sessions/login' do
  @user = User.find_by(username: params[:user][:username])
  # binding.pry
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Email and Password do not match our records."]
    erb :'sessions/login'
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
