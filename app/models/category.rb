class Category < ApplicationRecord
  has_many :category_article_joins, dependent: :destroy, inverse_of: :category
  has_many :articles, through: :category_article_joins, inverse_of: :categories
end
