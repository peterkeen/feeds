require 'feed_fetcher'

task :scheduler => :environment do
  Rails.application.eager_load!
  puts "Starting scheduler"

  FeedFetcher.run
end
