class ChangeTypesToText < ActiveRecord::Migration[4.2]
  def change
    change_column(:articles, :title, :text)
    change_column(:articles, :url, :text)
    change_column(:feeds,    :name, :text)
  end
end
