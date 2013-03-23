class FeedWorker
  include SuckerPunch::Worker

  def perform(feed_id)
    ActiveRecord::Base.connection_pool.with_connection do
      feed = Feed.find(feed_id)
      puts "Fetching feed #{feed_id} from #{feed.url}"
      FeedFetcher.new(feed).fetch
    end
  end
end
