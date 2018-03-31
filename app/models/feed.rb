class Feed < ActiveRecord::Base
  has_many :articles
  validates_presence_of :url

  def self.new_from_url(url)
    feeds = Feedbag.find(url)
    self.new(url: feeds[0])
  end
end
