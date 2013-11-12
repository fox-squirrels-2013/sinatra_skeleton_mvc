class CreateTwitterUserTable < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :username

       t.timestamp
    end
  end
end
