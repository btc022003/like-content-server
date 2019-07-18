class CreateArticleCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :article_collections do |t|
      t.belongs_to :user
      t.belongs_to :article
      t.timestamps
    end
  end
end
