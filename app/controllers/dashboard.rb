# Displays tweets of the people that the user is following
get '/dashboard' do
  if logged_in?
    @user = User.find_by(id: session[:id])
    p "session user: #{@user.id}"
    p "CONDITIONAL IF: #{UserFollower.find_by(follower_id: @user.id)}"
    if UserFollower.find_by(follower_id: @user.id)
      @userfollowers = UserFollower.where(follower: User.find(@user.id))
      @tweets = []
      p "@userfollowers: #{@userfollowers}"
      @userfollowers.each do |userfollower|
        p "UserFollower: #{userfollower}"
        userfollower.user.tweets.each do |tweet|
          p "tweet variable:#{tweet}"
          @tweets << tweet
        end
      end
      User.find(@user.id).retweets.each do |retweet|
        p "RETWEET :#{retweet}"
        p retweet
        @tweets << retweet
      end
      @tweets.sort {|first, second| first.created_at <=> second.created_at }
      p "TWEETS!!!!!!~~~~~~~~~~~~~~~~~~~~~~ #{@tweets}"
    end
    erb :"/dashboard"
  else
    redirect '/'
  end
end


# FOR DEBUGGING PURPOSES ONLY!
# The following route allows for:
# Forcing session ID to change to test for different dashboard views.
get '/dashboard/:id' do
  @user = User.find(params[:id])
  login(@user)
  redirect '/dashboard'
end

