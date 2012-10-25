class TwitterUser < ActiveRecord::Base
  attr_accessible :oauth_token, :oauth_token_secret, :profile
    
  def client
    Twitter::Client.new(
      :oauth_token => '262954659-wiyiKSBKrsYlI8qVfvjx51KyvADNik6OnDJWMUPv',
      :oauth_token_secret => 'z9XEGrUKxapTapq2Cz0VXkoXap33PeRqrXTCSq3pc'
    )  
  end
  
end
