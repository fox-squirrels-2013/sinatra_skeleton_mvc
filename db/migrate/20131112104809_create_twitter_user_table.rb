class CreateTwitterUserTable < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :twitter_handle

       t.timestamp
    end
  end
end
