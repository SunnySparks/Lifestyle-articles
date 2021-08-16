class ArticlesController < ApplicationController
  before_action :current_user
  before_action :require_user
  before_action :find_article, only: %i[show update destroy]

  def index
    @articles = Article.all.order(cached_votes_score: :desc)
    @categories = Category.all.includes(:articles).order(priority: :desc)
  end

  def new
    @article = Article.new
    @category = Category.new
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @article = @current_user.articles.new(article_params)
    @article.category_id = params[:category_id]
    if @article.save
      flash[:success] = 'New article created!'
      redirect_to categories_path
    else
      unless @article.avatar.attached?
        flash[:error] = 'No image attached, please add an image'
      end
      if @article.title.length < 3
        flash[:error] = 'Your title must have at least 3 characters'
      end
      if @article.text.length > 225
        flash[:error] = 'Your text is too long! Make it maximum 225 characters'
      end
      redirect_to root_path, notice: message
    end
  end

  def show
    @article = Article.find(params[:id])
    @articles = Article.all.order(cached_votes_up: :desc)
    @categories = Category.all.includes(:articles).order(cached_votes_up: :desc)
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @article = Article.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }
    @article.category_id = params[:category_id]
    if @article.update(article_params)
      flash[:success] = 'Article was successfully updated'
      redirect_to categories_path
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
    redirect_back(fallback_location: root_path)
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :category_id, :avatar)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
