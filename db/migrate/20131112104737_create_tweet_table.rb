class CreateTweetTable < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_data

      t.timestamp
    end
  end
end
