
# To display all tweets of ALL users
get '/tweets' do
  @tweets = Tweet.all

  erb :"/tweets/index"
end

# To create new tweet form
get '/tweets/new' do
  erb :'/tweets/new'
end

post '/tweets' do
  @tweet = Tweet.new(body: params[:body], user_id: session[:id] )
  if @tweet
    @tweet.save
    redirect "/user/#{@user.id}"
  else
    redirect "/tweets/new"
  end
end
