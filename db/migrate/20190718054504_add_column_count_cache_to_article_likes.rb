class AddColumnCountCacheToArticleLikes < ActiveRecord::Migration[5.1]
  def change
    add_column :article_likes, :count_of_article_likes, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
