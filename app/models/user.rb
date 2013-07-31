class User < ActiveRecord::Base
  include Sidekiq::Extensions::ActiveRecord
  
  has_many :tweets

  def create_client
    Twitter::Client.new(:oauth_token => self.oauth_token, :oauth_token_secret => self.oauth_secret)
  end

  def tweet(status)
    tweet = Tweet.create!(:status => status, user_id: self.id)
    TweetWorker.perform_async(tweet.id)
  end

end
