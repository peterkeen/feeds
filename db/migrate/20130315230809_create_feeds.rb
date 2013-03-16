class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :url
      t.string :name
      t.string :etag
      t.datetime :last_fetched_at

      t.timestamps
    end
  end
end
