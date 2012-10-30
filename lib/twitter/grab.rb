class Grab
  
  def initialize(client)
    @client = client
  end

  def client
    @client
  end

  def followers_ids(screen_name)    
    user = client.user(screen_name)
    touches = []
    
    cursor = -1
    begin            
      followers = client.follower_ids(screen_name, :cursor => cursor)      
      followers.ids.each do |fid|
        touches << Touch.new(:user_id => user.id,
                             :user_screen_name => screen_name, 
                             :follower_id => fid)
      end
      cursor = followers.next_cursor
      
      Touch.import touches
    end while cursor != 0       
  end
 
  def followers_info(screen_name) 
    user = client.user(screen_name)
    
    Touch.find_in_batches(:conditions => {:user_id => user.id, :follower_screen_name => nil}, :batch_size => 100) do |touches|      
      update_followers_info(user, touches)                                  
    end     
  end

  private
    def update_followers_info(user, touches)
      loop do
        begin      
          update_followers_info_unsafe(user, touches)
          break
        rescue
          sleep 5
          p 'twitter api error'
        end
      end
    end
  
    def update_followers_info_unsafe(user, touches)
      update_touches = []
      
      followers_users(touches).each do |follower|
        update_touches  << Touch.new(:user_id => user.id,
                                     :user_screen_name => user.screen_name, 
                                     :follower_id => follower.id,
                                     :follower_screen_name => follower.screen_name,
                                     :follower_friends_count => follower.friends_count,
                                     :follower_followers_count => follower.followers_count)
      end
      
      Touch.import update_touches, 
                   :on_duplicate_key_update => [:follower_screen_name, 
                                                :follower_friends_count, 
                                                :follower_followers_count]
      
    end
  
    def followers_users(touches)
      ids = touches.map { |touch| touch.follower_id } 
      client.users(ids)      
    end
 
end