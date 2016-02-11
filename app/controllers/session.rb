get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session['user'] = @user.email
    redirect "/users/#{@user.id}"
  else
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  session['user'] = nil
  redirect '/'
end

get '/sessions-viewer' do
  session.inspect
end
