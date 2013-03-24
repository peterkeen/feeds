class ChangeTypesToText < ActiveRecord::Migration
  def change
    change_column(:articles, :title, :text)
    change_column(:articles, :url, :text)
    change_column(:feeds,    :name, :text)
  end
end
