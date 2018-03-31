class CreateArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :guid
      t.datetime :published_at
      t.text :content

      t.timestamps
    end
  end
end
