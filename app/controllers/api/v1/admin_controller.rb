class Api::V1::AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role == "editor"
      articles = Article.where(published: false)
      render json: articles, each_serializer: ArticlesShowSerializer
    else
      render json: {
               message: "You are not authenticated to view unpublished articles",
             },
             status: 401
    end
  end

  def create
    if current_user.role == "journalist"
      article = Article.create(article_params)
      if article.persisted? && attach_image(article)
        render json: { message: "Your article was saved" }
      else
        render json: { message: article.errors.full_messages.to_sentence },
               status: 422
      end
    else
      render json: { message: "You are not authenticated to create an article" },
             status: 401
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :snippet, :content, :category, :premium)
  end

  def attach_image(article)
    params_image = params["article"]["image"]

    if params_image.present?
      DecodeService.attach_image(params_image, article.image)
    end
  end
end
