task :scheduler => :environment do
  puts "Starting scheduler"
  scheduler = Rufus::Scheduler.start_new

  scheduler.every '10m' do
    Feed.all.each do |feed|
      puts "Fetching feed #{feed.id} from #{feed.url}"
      FeedFetcher.new(feed).fetch
    end
  end

  scheduler.join

end
