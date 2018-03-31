require 'feed_fetcher'

task :scheduler => :environment do
  Rails.application.eager_load!
  puts "Starting scheduler"

  FeedFetcher.run
end

task :fetch => :environment do
  Rails.application.eager_load!
  puts "Fetching feeds"
  FeedFetcher.run_once
end
