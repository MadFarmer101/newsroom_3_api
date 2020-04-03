class Api::V1::ArticlesController < ApplicationController

  def index
    articles = Article.where(published: true)
    render json: articles, each_serializer: ArticlesIndexSerializer
  end

  def show
    article = Article.find(params[:id])
    render json: article, serializer: ArticlesShowSerializer
  end
end
