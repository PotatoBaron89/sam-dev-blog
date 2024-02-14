class CategoryArticleJoin < ApplicationRecord
  belongs_to :category, inverse_of: :category_article_joins
  belongs_to :article, inverse_of: :category_article_joins
end
