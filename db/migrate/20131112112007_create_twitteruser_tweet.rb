class CreateTwitteruserTweet < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :screen_name
      t.string :tweet_id
      # t.integer :twitter_user_id
      # t.references :twitter_users
      t.timestamps
    end

    create_table :twitter_users do |t|
      t.string :screen_name
      t.timestamps
    end

    add_reference :tweets, :twitter_user, index: true
  end
end
