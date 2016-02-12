get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.create(params[:user])
  if @user
    login(@user)
    redirect "/dashboard"
  else
    redirect 'users/new'
  end
end

#dsisplay all tweets of user
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

#display all followers of user
get '/users/:id/followers' do
  @user = User.find(params[:id])
  erb :'users/followers'
end
