class FeedFetcher

  def self.run
    STDERR.puts "Starting fetcher"
    scheduler = Rufus::Scheduler.start_new
    scheduler.every ENV['FETCH_INTERVAL'] + 's' do
      run_once
    end
    scheduler.join
  end

  def self.run_once
    Feed.find_each do |feed|
      begin
        puts "Fetching feed #{feed.id} from #{feed.url}"
        self.new(feed).fetch
      rescue Exception => e
        puts "Error when fetching feed #{feed.id}: #{e.message}"
      end
    end    
  end
  
  def initialize(feed)
    @feed = feed
  end

  def fetch(force = false)
    response = fetch_content(force)
    return if response.code == 304

    content = Feedjira::Feed.parse(response.body)

    @feed.etag = content.etag
    @feed.last_fetched_at = content.last_modified
    @feed.name= content.title
    @feed.save!

    content.entries.each do |entry|
      next if Article.where(:feed_id => @feed.id, :guid => entry.entry_id).count > 0
      article = Article.create!(
        :feed_id      => @feed.id,
        :guid         => entry.entry_id,
        :title        => entry.title.gsub('&nbsp;', ' '),
        :url          => entry.url,
        :content      => (entry.content || entry.summary),
        :published_at => entry.try(:updated)
      )
      ArticleMailer.send_article(article).deliver
    end
    nil
  end

  def fetch_content(force = false)
    headers = {}
    unless force
      if @feed.last_fetched_at
        headers['If-Modified-Since'] = @feed.last_fetched_at.rfc2822
      end

      if @feed.etag
        headers['If-None-Match'] = @feed.etag
      end
    end

    HTTParty.get(@feed.url, :headers => headers)
  end
end
