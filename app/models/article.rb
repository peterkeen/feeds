class Article < ActiveRecord::Base
  #attr_accessible :content, :description, :guid, :published_at, :title, :feed_id, :url
  belongs_to :feed
end
