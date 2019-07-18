class Api::V1::ArticleCommentsController < ApiController
  def index
    # @article = params[:article_id]
    render json: { id: params[:article_id] }
  end
end
