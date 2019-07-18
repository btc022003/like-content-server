class CreateArticleLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :article_likes do |t|
      t.belongs_to :user
      t.belongs_to :article
      t.timestamps
    end
  end
end
