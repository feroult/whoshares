class Touch < ActiveRecord::Base
  attr_accessible :user_id,
                  :user_screen_name, 
                  :follower_id, 
                  :follower_screen_name, 
                  :follower_friends_count, 
                  :follower_followers_count

  validates_inclusion_of :status, :in => [:never, :waiting, :already, :ok, :fail]

end
