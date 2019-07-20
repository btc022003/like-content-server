class Article < ApplicationRecord
  belongs_to :user, counter_cache: :count_of_articles
  has_many :article_likes
  has_many :article_comments
  has_many :article_collections

  validates :title, presence: true

  after_initialize :set_default_attr

  def set_default_attr
    self.descriptions ||= '' if has_attribute?(:descriptions)
    self.cover_img ||= '' if has_attribute?(:cover_img)
    self.count_of_article_likes ||= 0 if has_attribute?(:count_of_article_likes)
    self.count_of_article_collections ||= 0 if has_attribute?(:count_of_article_collections)
    self.count_of_article_comments ||= 0 if has_attribute?(:count_of_article_comments)
  end
end
