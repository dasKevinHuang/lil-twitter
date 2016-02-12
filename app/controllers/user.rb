get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.create(params[:user])
  if @user
    login(@user)
    p "dashboard"
    redirect '/dashboard'
  else
    p "homepage"
    redirect 'users/new'
  end
end

#dsisplay all tweets of user
get '/users/:id' do
  @user = User.find(params[:id])
  @tweets = @user.tweets
  erb :'users/show'
end

#display all followers of user
get '/users/:id/followers' do
  @user = User.find(params[:id])
  @followers = @user.followers
  erb :'users/followers'
end

get '/users' do
  @users = User.all
  erb :'users/all'
end
