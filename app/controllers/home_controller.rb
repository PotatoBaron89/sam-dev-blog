class HomeController < ApplicationController
  def index
    @pagy, @articles = pagy(Article.order(created_at: :desc).all, items: 10)
  end

  def about
  end
end
