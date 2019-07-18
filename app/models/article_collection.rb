class ArticleCollection < ApplicationRecord
  belongs_to :user, counter_cache: :count_of_article_collections
  belongs_to :article, counter_cache: :count_of_article_collections

  validates :user_id, presence: true, uniqueness: { scope: [:article_id], message: '不能重复操作' }
end
