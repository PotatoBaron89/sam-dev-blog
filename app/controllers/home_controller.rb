class HomeController < ApplicationController
  def index
    @pagy, @articles = pagy(Article.with_rich_text_content_and_embeds.eager_load(:categories).order(created_at: :desc).all, items: 10)

    render 'articles/index'
  end

  def about; end
end
