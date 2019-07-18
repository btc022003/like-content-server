class Api::V1::ArticleCommentsController < ApiController
  before_action :authenticate!, except: [:index]

  def index
    article = Article.find(params[:article_id])
    @acs = article.article_comments.order('id desc')
    @acs = if params[:per].present?
      @acs.page(params[:page]).per(params[:per])
    else
      @acs.page(params[:page])
    end
  end

  def create
    article = Article.find(params[:article_id])
    ac = article.article_comments.new(
      content: params[:content],
      user_id: current_user.id
    )
    if ac.save
      render_json('y', '操作成功')
    else
      render_json('n', '操作失败', ac.errors.full_messages)
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    ac = article.article_comments.where('id=? and user_id=?', params[:id], current_user.id).first
    if ac.present?
      if ac.destroy
        render_json('y', '操作成功')
      else
        render_json('n', '操作失败', ac.errors.full_messages)
      end
    else
      render_json('n', '当前记录不存在')
    end
  end
end
