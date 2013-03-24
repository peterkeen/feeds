if ENV['FETCH_IN_PROCESS'] == 'true'
  Thread.new do
    puts "Starting fetcher"
    FeedFetcher.run
  end
end
