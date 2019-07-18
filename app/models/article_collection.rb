class ArticleCollection < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :user_id, presence: true, uniqueness: { scope: [:article_id] }
end
