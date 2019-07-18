class CreateArticleComments < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comments do |t|
      t.string :content
      t.belongs_to :user
      t.belongs_to :article
      t.timestamps
    end
  end
end
