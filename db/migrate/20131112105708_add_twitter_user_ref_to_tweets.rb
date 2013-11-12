class AddTwitterUserRefToTweets < ActiveRecord::Migration
  def change
    # add_column :tweets, :username, :integer
    # add_index :tweets, :username
    add_reference :tweets, :twitter_user, index: true
  end
end
