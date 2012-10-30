class CreateTouches < ActiveRecord::Migration
  def change
    create_table :touches do |t|
      t.integer :user_id, :precision => 15
      t.string  :user_screen_name      
      
      t.integer :follower_id, :precision => 15
      t.string  :follower_screen_name
      t.integer :follower_friends_count, :precision => 10
      t.integer :follower_followers_count, :precision => 10      
      
      t.timestamps
    end
    
    add_index :touches, [:user_id, :follower_id], :unique => true
  end
end
