class CreateUserFollowers < ActiveRecord::Migration
  def change
    create_table :user_followers do |t|
      t.references :user
      t.integer :follower_id

      t.timestamps
    end
  end
end
