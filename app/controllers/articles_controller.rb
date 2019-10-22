class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(article_params)
     if @articles.save
        redirect_to article_path(@articles)
     else
       redirect_to new_article, alert: "Article successfully created!"
     end
  end

  def show
    @articles = Article.find(params[:id])
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def update
    @articles = Article.find(params[:id])
    @articles.update(article_params)
    @articles.save
    redirect_to article_path(@articles)
  end

  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy
    redirect_to articles_path, alert: "Article successfully deleted!"
  end

  private

   def article_params
    params.require(:article).permit(:title, :content)
  end
end
