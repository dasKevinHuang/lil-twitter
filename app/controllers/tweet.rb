
# To display all tweets of ALL users
get '/tweets' do
  @user_id = session[:id]
  @tweets = Tweet.all
  @sorted_tweets = @tweets.sort {|first, second| first.created_at <=> second.created_at }

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
