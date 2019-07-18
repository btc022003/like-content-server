class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :descriptions
      t.string :cover_img
      t.string :content, limit: 429496
      t.belongs_to :user
      t.timestamps
    end
  end
end
