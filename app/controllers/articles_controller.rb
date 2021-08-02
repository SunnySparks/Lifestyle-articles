class ArticlesController < ApplicationController
  before_action :current_user
  before_action :require_user
  before_action :find_article, only: %i[show update destroy]

  def index
    @articles = Article.all(:order => "vote_total DESC")
    @categories = Category.all.includes(:articles).order(priority: :desc)
  end

  def new
    @article = Article.new
    @category = Category.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    # @article = current_user.articles.new(title: params[:article_title], text: params[:article_text])
    @article = @current_user.articles.new(article_params)
    @article.category_id = params[:category_id]
    if @article.save
      flash[:success] = 'New article created!'
      redirect_to categories_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.all
    @categories = Category.all.includes(:articles).order(priority: :desc)
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @categories = Category.all.map { |c| [c.name, c.id] }
    if @article.update(article_params)
      @article.artcats.first.delete
      @article.categories << Category.find_by(id: params[:categories])
      flash[:success] = 'Article was successfully updated'
      redirect_to @article
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = 'Article was successfully deleted.'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to root_url
  end

  def upvote
    @article = Article.find(params[:id])
    @article.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @article = Article.find(params[:id])
    @article.downvote_by current_user
    redirect_to categories_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category_id, :avatar)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
