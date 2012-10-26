class TwitterUser < ActiveRecord::Base
  attr_accessible :oauth_token, :oauth_token_secret, :profile
    
  def client
    @client ||= Twitter::Client.new(
      :oauth_token => oauth_token,
      :oauth_token_secret => oauth_token_secret
    )  
  end
  
  def tweet(msg)
    client.update(msg)
  end
    
end
