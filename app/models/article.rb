class Article < ApplicationRecord
  has_many :category_article_joins, dependent: :destroy, inverse_of: :article
  has_many :categories, through: :category_article_joins, inverse_of: :articles

  has_rich_text :content
end
