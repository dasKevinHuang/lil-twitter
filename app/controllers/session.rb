get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user)
    redirect "/dashboard"
  else
    redirect '/sessions/new'
  end
end

delete '/sessions' do
  logout
  redirect '/'
end

get '/sessions-viewer' do
  session.inspect
end
