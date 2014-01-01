class TwitterService

  class RealTwitterClient

    def initialize(config)
      @config = config
    end

    def post(message)
      client.update(message)
    end

    protected

    def client
      @client ||= Twitter::REST::Client.new(@config)
    end

  end

  class FakeTwitterClient
    def post(message)
      Rails.logger.info("FakeTwitter: '#{message}'")
    end
  end

  def self.twitter_client
    if Rails.env.production?
      RealTwitterClient.new(
        :consumer_key        => Rails.application.secrets.twitter_consumer_key,
        :consumer_secret     => Rails.application.secrets.twitter_consumer_secret,
        :access_token        => Rails.application.secrets.twitter_access_token,
        :access_token_secret => Rails.application.secrets.twitter_access_token_secret
      )
    else
      FakeTwitterClient.new
    end
  end

  def self.post(message)
    twitter_client.post(message)
  end

end