class CreateUserRetweets < ActiveRecord::Migration
  def change
    create_table :user_retweets do |t|
    t.integer :user_id
    t.integer :tweet_id

    t.timestamps
  end
  end
end
