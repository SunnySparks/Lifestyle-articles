class CategoriesController < ApplicationController
  # before_action :find_category, only: %i[show edit update]
  before_action :require_user, only: %i[create new]
  def index
    @article = Article.new
    @articles = Article.all.order(cached_votes_score: :desc)
    @firstcat = Category.where({ :id => [1] }).includes(:articles)
    @categories = Category.all.includes(:articles).order(priority: :desc)
    @voted_article = Article.highest_voted
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save!
    if @category.save
      flash[:success] = 'Category successfully created'
      redirect_to categories_path
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @articles = Article.all.order(:created_at).reverse_order
    @category = Category.find(params[:id])
    @categories = Category.all.includes(:articles).order(:created_at).reverse_order
  end

  def edit; end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = 'Category was successfully updated'
      redirect_to @category
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end
end
