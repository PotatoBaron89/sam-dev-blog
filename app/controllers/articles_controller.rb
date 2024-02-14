class ArticlesController < ApplicationController
  def index
    query = Article.order(created_at: :desc)
    query = Article.joins(:categories).where(categories: {name: params[:category]}) if params[:category].present?

    @pagy, @articles = pagy(query, items: 10)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
