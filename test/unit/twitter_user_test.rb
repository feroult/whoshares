require 'test_helper'

class TwitterUserTest < ActiveSupport::TestCase
  
  fixtures :twitter_users
 
  test ".tweet" do     
    user = twitter_users(:tweetouch_me)  
    assert user.tweet('hi there 2').text == 'hi there 2'            
  end
   
end
