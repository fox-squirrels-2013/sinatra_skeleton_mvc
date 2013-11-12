class Tables < ActiveRecord::Migration
  def change
    create_table :twitter_user do |t|
      t.string :username
    end
  end
end
