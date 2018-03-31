class AddFeedIdToArticle < ActiveRecord::Migration[4.2]
  def change
    change_table :articles do |t|
      t.integer :feed_id
    end
  end
end
