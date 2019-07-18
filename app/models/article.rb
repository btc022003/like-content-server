class Article < ApplicationRecord
  belongs_to :user
  has_many :article_likes
  has_many :article_comments
  has_many :article_collections

  validates :title, presence: true
end
