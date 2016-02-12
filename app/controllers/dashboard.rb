
# Displays tweets of the people that the user is following
get '/dashboard' do
  @user = User.find(id: session[:id])
  @userfollowers = UserFollower.find_by(follower: @user)
  @tweets = []
  @userfollowers.each do |userfollower|
    userfollower.user.tweets.each do |tweet|
      @tweets << tweet
  end
  @tweets.sort {|first, second| first.created_at <=> second.created_at }
  if logged_in?
    erb :"/dashboard"
  else
    redirect '/'
  end
end



