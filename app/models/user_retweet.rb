class UserRetweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :retweeter, class_name: "User", foreign_key: "user_id"
  belongs_to :retweet, class_name: "Tweet", foreign_key: "tweet_id"
end
