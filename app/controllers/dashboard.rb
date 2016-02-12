
# Displays tweets of the people that the user is following
get '/dashboard' do
  @user = User.find_by(id: session[:id])
  if UserFollower.find_by(follower: @user)
    @userfollowers = UserFollower.find_by(follower: @user)
    @tweets = []
    @userfollowers.each do |userfollower|
      userfollower.user.tweets.each do |tweet|
        @tweets << tweet
      end
    end
    @tweets.sort {|first, second| first.created_at <=> second.created_at }
    if logged_in?
      erb :"/dashboard"
    else
      redirect '/'
    end
  else
    redirect '/'
  end
end



