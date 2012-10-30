class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.integer :user_id, :precision => 15
      t.string :screen_name
      t.string :oauth_token
      t.string :oauth_token_secret

      t.timestamps
    end
  end
end
