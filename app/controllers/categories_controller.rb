class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @pagy, @categories = pagy(Category.all, items: 10)
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  protected

  def set_category
    @category = Category.find(params[:id])
  end
end
