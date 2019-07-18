class AddColumnCountCacheToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :count_of_article_likes, :integer
    remove_column :articles, :count_of_article_likes
  end
end
