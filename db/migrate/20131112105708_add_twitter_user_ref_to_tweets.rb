class AddTwitterUserRefToTweets < ActiveRecord::Migration
  def change
    # add_column :tweets, :twitter_handle_id, :integer
    # add_index :tweets, :twitter_handle
    add_reference :tweets, :twitter_user, index: true
  end
end
