class ArticleComment < ApplicationRecord
  belongs_to :user, counter_cache: :count_of_article_comments
  belongs_to :article, counter_cache: :count_of_article_comments
end
