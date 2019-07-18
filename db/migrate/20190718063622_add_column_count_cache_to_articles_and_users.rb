class AddColumnCountCacheToArticlesAndUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :count_of_article_likes, :integer
    add_column :users, :count_of_article_collections, :integer
    add_column :users, :count_of_article_comments, :integer
    add_column :articles, :count_of_article_collections, :integer
    add_column :articles, :count_of_article_comments, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
