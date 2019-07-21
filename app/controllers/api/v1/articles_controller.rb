class Api::V1::ArticlesController < ApiController
  before_action :authenticate!, except: [:index, :show]

  def index
    @articles = Article.select(:id, :title, :descriptions,
      :cover_img, :count_of_article_collections,
      :count_of_article_comments,
      :count_of_article_likes).order('id desc')
    if params[:title].present?
      @articles = @articles.where('title LIKE ?', '%#{params[:title]}%')
    end
    @articles = if params[:per].present?
      @articles.page(params[:page]).per(params[:per])
    else
      @articles.page(params[:page])
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.content = @article.content.gsub('src="/uploads', 'src="' + self_server_url + '/uploads')
    render_json('y', '获取数据成功', @article)
  end

  def create
    @article = Article.new article_params
    @article.user_id = current_user.id
    if @article.save
      render_json('y', '操作成功', { id: @article.id })
    else
      render_json('n', '操作失败', @article.errors.full_messages)
    end
  end

  def update
    @article = Article.where('id=? and user_id=?', params[:id], current_user.id).first
    if @article.present?
      @article.title = params[:title]
      @article.content = params[:content]
      @article.descriptions = params[:descriptions]
      @article.cover_img = params[:cover_img]
      if @article.save
        render_json('y', '操作成功')
      else
        render_json('n', '操作失败', @article.errors.full_messages)
      end
    else
      render_json('n', '操作失败', '需要修改的记录不存在')
    end

    def destroy
      @article = Article.where('id=? and user_id=?', params[:id], current_user.id).first
      if @article && @article.destroy
        render_json('y', '成功删除一个问答游戏的用户数据')
      else
        render_json('y', '删除用户数据失败', @qagame_user.errors.full_messages)
      end
    end
  end

  private

    def article_params
      params.permit(:title, :cover_img, :descriptions, :content)
    end
end
