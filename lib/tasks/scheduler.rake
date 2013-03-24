require 'feed_fetcher'

task :scheduler => :environment do
  puts "Starting scheduler"

  while true
    Feed.all.each do |feed|
      puts "Fetching feed #{feed.id} from #{feed.url}"
      FeedFetcher.new(feed).fetch
    end
    sleep 60*10
  end

end
