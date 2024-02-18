class ArticlesController < ApplicationController
  before_action :check_user_signed_in?, except: [:index, :show]

  def index
    query = Article.order(created_at: :desc)
    query = query.joins(:categories).where(categories: { name: params[:category]}) if params[:category].present?

    @pagy, @articles = pagy(query, items: 10)
  end

  def show
    @article = Article.find(params[:id])
    @pagy, @comments = pagy(@article.comments.eager_load(:commenter).order(created_at: :desc), items: 10)
  end

  def show_card
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
    authorize! :edit, @article
  end

  def update
    @article = Article.find(params[:id])
    authorize! :update, @article

    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def favourite
    @article = Article.find(params[:id])
    authorize! :read, @article

    current_user.favourite_articles << @article
    redirect_to article_path(@article)
  end

  def destroy
  end

  protected

  def article_params
    params.require(:article).permit(:name, :content, :archived, :featured)
  end
end
