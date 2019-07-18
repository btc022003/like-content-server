class User < ApplicationRecord
  has_many :articles
  has_many :article_comments
  has_many :article_collections
  has_many :article_likes

  validates :user_name, presence: { message: '用户名不能为空' }, uniqueness: { message: '用户名已经存在' }, on: :create
  validates :password, presence: { message: '密码不能为空' }, on: :create

  # 修改密码
  def update_pwd(old_password, password)
    if old_password == self.password
      self.password = Digest::MD5.hexdigest(password)
      self.save
    end
  end

  # 验证密码是否一致
  def validate_pwd(pwd)
    Digest::MD5.hexdigest(pwd) == self.password
  end
end
