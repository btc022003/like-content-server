class Api::V1::ArticleLikesController < ApiController
  before_action :authenticate!
  def create
    # @article = params[:article_id]
    article = Article.find(params[:article_id])
    al = article.article_likes.new(
      user_id: current_user.id
    )
    if al.save
      render_json('y', '操作成功')
    else
      render_json('n', '操作失败', al.errors.full_messages)
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    al = article.article_likes.find_by_user_id(current_user.id)
    if al.present?
      if al.destroy
        render_json('y', '操作成功')
      else
        render_json('n', '操作失败', al.errors.full_messages)
      end
    else
      render_json('n', '没有点赞该文章')
    end
  end
end
