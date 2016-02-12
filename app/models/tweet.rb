class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  has_many :user_retweets
  belongs_to :user
  has_many :retweeters, through: :user_retweets, source: :retweeter
end
