class AddColumnCountCacheToArticles2 < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :count_of_article_likes, :integer
    remove_column :article_likes, :count_of_article_likes
  end
end
