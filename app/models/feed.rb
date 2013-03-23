class Feed < ActiveRecord::Base
  attr_accessible :etag, :last_fetched_at, :name, :url
  has_many :articles

  def stripped_name
    name.gsub(/&.{0,}?;/, '')
  end
end
