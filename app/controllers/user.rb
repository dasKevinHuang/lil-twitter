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
  @tweets = @user.tweets + @user.retweets
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

post '/users/:id/followers' do
  user  = User.find(session[:id])
  followed_user = User.find(params[:id])

  if followed_user.followers << user

  redirect "/dashboard"
end
end


post '/users/:id/tweets' do

  user = User.find(session[:id])
  tweet = Tweet.find(params[:id])
  if tweet.user != user
    user.retweets << tweet
      redirect "/users/#{user.id}"
    else
      redirect '/users/:id/tweets'
  end
end
