class ArticlesController < ApplicationController
  before_action :check_user_signed_in?, except: [:index, :show]

  def index
    query = Article.where(archived: false).order(created_at: :desc)
    query = query.joins(:categories).where(categories: { name: params[:category]}) if params[:category].present?

    @pagy, @articles = pagy(query, items: 10)
  end

  def show
    @article = Article.where(archived: false)
      .eager_load(comments: :commenter)
      .where(comments: { archived: false })
      .order(created_at: :desc)
      .find(params[:id])
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
    @article = Article.left_outer_joins(:favourite_articles_joins)
      .where(favourite_articles_joins: { user: current_user })
      .find_by(id: params[:id])

    return head :no_content unless @article

    authorize! :read, @article

    current_user.favourite_articles << @article unless current_user.favourite_articles.include?(@article)
    redirect_to article_path(@article)
  end

  def destroy; end

  protected

  def article_params
    params.require(:article).permit(:name, :content, :archived, :featured, :category_ids, :card_image)
  end
end
