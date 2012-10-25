class Touch < ActiveRecord::Base
  attr_accessible :from, :touch

  def self.search_recent_from(from)
    user = TwitterUser.new
    client = user.client
    client.update('hi ow')
  end

end
