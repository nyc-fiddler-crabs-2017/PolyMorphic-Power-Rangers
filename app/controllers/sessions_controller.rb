get '/' do
 erb :'/sessions/redirect'
end

get '/sessions/login' do
  if request.xhr?
    erb :'/sessions/login', layout: false
  else
    erb :'/sessions/login'
  end
end

post '/sessions/login' do
  @user = User.find_by(username: params[:user][:username])
  # binding.pry
  if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      if request.xhr?
        erb :_logged_in, layout: false
      else
        redirect '/'
      end
  else
    @errors = ["Email and Password do not match our records."]
    redirect '/404'
      
  end
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end

get '/404' do
  erb :'_404'
end
