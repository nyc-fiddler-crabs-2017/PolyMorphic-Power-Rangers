get '/' do
 erb :'/sessions/redirect'
end


get '/sessions/login' do
  erb :'/sessions/login'
end

post '/sessions/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ["Email and Password do not match our records."]
    erb :'users/login'
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
