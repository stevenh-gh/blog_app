class ArticlesController < ApplicationController
  def index # by default, this will render app/views/articles/index.html.erb
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new # insanciates, but does not save
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      # use redirect_to after mutating the db,
      # b/c if user refreshes with render (rerendering),
      # browser will make same request
      redirect_to @article # redirects to localhost:3000/articles/article.id
    else
      render :new # renders /app/views/articles/new.html.erb
    end
  end

  private

  def article_params
    params.require(:article).permit :title, :body
  end
end
