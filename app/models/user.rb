class User < ApplicationRecord
  has_many :articles
  has_many :article_comments
  has_many :article_collections
  has_many :article_likes

  validates :user_name, presence: { message: '用户名不能为空' }, uniqueness: { message: '用户名已经存在' }, on: :create
  validates :password, presence: { message: '密码不能为空' }

  after_initialize :set_default_attr

  # 修改密码
  def update_pwd(old_password, password)
    if validate_pwd(old_password)
      self.password = Digest::MD5.hexdigest(password)
      self.save
      true
    else
      false
    end
  end

  # 验证密码是否一致
  def validate_pwd(pwd)
    Digest::MD5.hexdigest(pwd) == self.password
  end

  def set_default_attr
    self.count_of_article_likes ||= 0 if has_attribute?(:count_of_article_likes)
    self.count_of_article_collections ||= 0 if has_attribute?(:count_of_article_collections)
    self.count_of_article_comments ||= 0 if has_attribute?(:count_of_article_comments)
    self.count_of_articles ||= 0 if has_attribute?(:count_of_articles)
  end
end
