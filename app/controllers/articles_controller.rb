class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "Your article published successfully"
      redirect_to root_path
    else
      flash[:danger] = "Something went wrong, Please try again"
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
