class Api::V1::ArticlesController < ApiController
  before_action :authenticate!, except: []

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new article_params
    @article.user_id = current_user.id
    if @article.save
      render_json("y", "操作成功")
    else
      render_json("n", "操作失败",  @machine.errors.full_messages)
    end
  end

  private

    def article_params
      params.permit(:title, :cover_img, :descriptions, :content)
    end
end
