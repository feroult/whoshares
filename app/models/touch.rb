class Touch < ActiveRecord::Base
  attr_accessible :from, :touch
  
  def self.recent_followers(client, screen_name)
    cursor = -1
    begin
      #followers = client.follower_ids(screen_name, :cursor => cursor)
      followers = client.friend_ids(screen_name, :cursor => cursor)
      followers.ids.each do |fid|
        follower = client.user(fid)
        p follower.screen_name
        #p fid
      end
      cursor = followers.next_cursor
    end while cursor != 0
  end

end
