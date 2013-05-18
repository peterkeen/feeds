class Feed < ActiveRecord::Base
  attr_accessible :etag, :last_fetched_at, :name, :url
  has_many :articles

  def self.new_from_url(url)
    feeds = Feedbag.find(url)
    obj = self.new

    if feeds.length > 0
      obj.url = feeds[0]
    else
      obj.errors[:base] << "could not find a feed for url #{url}"
    end
    obj
  end
end
