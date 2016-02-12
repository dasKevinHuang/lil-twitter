class UserFollower < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
end
