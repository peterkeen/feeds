class Feed < ActiveRecord::Base
  attr_accessible :etag, :last_fetched_at, :name, :url
  has_many :articles
  validates_presence_of :url

  def self.new_from_url(url)
    feeds = Feedbag.find(url)
    self.new(url: feeds[0])
  end
end
