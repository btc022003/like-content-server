class Article < ApplicationRecord
  belongs_to :user, counter_cache: :count_of_articles
  has_many :article_likes
  has_many :article_comments
  has_many :article_collections

  validates :title, presence: true
end
