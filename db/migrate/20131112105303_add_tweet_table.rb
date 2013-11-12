class AddTweetTable < ActiveRecord::Migration
  def change
    create_table :tweet do |t|
      t.string :tweet_text
    end
  end
end
