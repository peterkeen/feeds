class AddFeedIdToArticle < ActiveRecord::Migration
  def change
    change_table :articles do |t|
      t.integer :feed_id
    end
  end
end
