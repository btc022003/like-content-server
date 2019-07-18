class ArticleLike < ApplicationRecord
  belongs_to :user
  belongs_to :article, counter_cache: :count_of_article_likes

  validates :user_id, presence: true, uniqueness: { scope: [:article_id], message: '不能重复操作' }
end
